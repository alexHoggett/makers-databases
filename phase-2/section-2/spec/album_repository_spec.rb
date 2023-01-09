require "album_repository"

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  before(:each) do
    reset_albums_table
  end

  it "returns all albums" do
    repo = AlbumRepository.new
    albums = repo.all
    
    expect(albums[0].id).to eq 1
    expect(albums[0].title).to eq 'Doolittle'
    expect(albums[0].release_year).to eq 1989
    expect(albums[0].artist_id).to eq 1

    expect(albums[1].id).to eq 2
    expect(albums[1].title).to eq 'Super Trouper'
    expect(albums[1].release_year).to eq 1980
    expect(albums[1].artist_id).to eq 2
  end

  it "returns a single record by its ID" do
    repo = AlbumRepository.new

    album = repo.find(1)


    expect(album.id).to eq 1
    expect(album.title).to eq 'Doolittle'
    expect(album.release_year).to eq 1989
    expect(album.artist_id).to eq 1
  end

  it "Adds an album to the albums table" do
    repo = AlbumRepository.new

    album = Album.new
    album.title = 'Hot Pink'
    album.release_year = 2019
    album.artist_id = 3
    repo.create(album)

    albums = repo.all
    expect(albums.length).to eq 3
    expect(albums[-1].title).to eq 'Hot Pink'
    expect(albums[-1].release_year).to eq 2019
    expect(albums[-1].artist_id).to eq 3
    expect(
      albums.any? { |a| a.title == album.title }
    ).to eq true
  end

  it "Deletes an album from the albums table" do
    repo = AlbumRepository.new
    albums = repo.all
    expect(albums.length).to eq 2
    repo.delete(1)
    albums = repo.all
    expect(albums.length).to eq 1
  end

  it "Updates an album" do
    repo = AlbumRepository.new
    repo.update(1, 'title', 'Doolittler')
    album = repo.find(1)
    expect(album.title).to eq 'Doolittler'
  end
end