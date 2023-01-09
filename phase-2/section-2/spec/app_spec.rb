require_relative "../app.rb"

def reset_tables
  seed_sql = File.read('spec/seeds_all.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do
    reset_tables
  end

  it "returns the list of albums" do
    io = double :io

    app = Application.new(
      'music_library_test',
      io,
      AlbumRepository.new,
      ArtistRepository.new
    )
    
    expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
    expect(io).to receive(:puts).with(no_args).ordered
    expect(io).to receive(:puts).with("What would you like to do?").ordered
    expect(io).to receive(:puts).with("1 - List all albums").ordered
    expect(io).to receive(:puts).with("2 - List all artists").ordered
    expect(io).to receive(:print).with("Enter your choice: ").ordered
    expect(io).to receive(:gets).and_return("1").ordered

    expect { app.run }.to output("* 1 - Doolittle\n* 2 - Super Trouper\n").to_stdout
  end

end