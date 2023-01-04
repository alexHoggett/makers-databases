require "artist_repository"

def reset_artists_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do
    reset_artists_table
  end

  it "Returns all artists" do
    repo = ArtistRepository.new

    artists = repo.all

    expect(artists.length).to eq 2

    expect(artists[0].id).to eq 1
    expect(artists[0].name).to eq 'Pixies'
    expect(artists[0].genre).to eq 'Rock'

    expect(artists[1].id).to eq 2
    expect(artists[1].name).to eq 'Abba'
    expect(artists[1].genre).to eq 'Pop'
  end

  it "Returns a single record by it's ID" do
    repo = ArtistRepository.new

    artist = repo.find(1)

    expect(artist.id).to eq 1
    expect(artist.name).to eq 'Pixies'
    expect(artist.genre).to eq 'Rock'
  end

  it "Adds an artist to the artists table" do
    repo = ArtistRepository.new
    repo.create('Doja Cat', 'Pop')
    artists = repo.all
    expect(artists.length).to eq 3
    expect(artists[-1].name).to eq 'Doja Cat'
    expect(artists[-1].genre).to eq 'Pop'
  end

  it "Deletes an artist from the artists table" do
    repo = ArtistRepository.new
    artists = repo.all
    expect(artists.length).to eq 2
    repo.delete(1)
    artists = repo.all
    expect(artists.length).to eq 1
  end

  it "Updates an artist" do
    repo = ArtistRepository.new
    repo.update(1, 'name', 'Shmixies')
    artist = repo.find(1)
    expect(artist.name).to eq 'Shmixies'
  end

end