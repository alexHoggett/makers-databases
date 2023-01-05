## 1. Design and Create the Table

Already completed for us.

## 2. Create Test SQL Seeds

Already completed for us.

## 3. Define the Class Names

```ruby
# Table name: albums

# Model Class
# (in lib/album.rb)
class Album
  attr_accessor :id, :title, :release_year, :artist_id # the attr_accessor which quickly allows us to set and get attributes for an object
end

# Repository Class
# (in lib/album_repository.rb)
class AlbumRepository
  # Selecting all records
  # No argumuments
  def all
    # Executes the sql query:
    # SELECT * from albums;

    # Returns an array of album objects
  end

  # Gets a single record by its ID
  # One arg: id (number)
  def find(id)
    # Executes the sql query:
    # SELECT * from albums where id = $id;

    # Returns an album object
  end

  # adds an album
  # 3 args: title (string) release_year (number) artist_id (number)
  def create(title, release_year, artist_id)
    # Executes the sql query:
    # INSERT INTO albums (title, release_year, artist_id)
    # VALUES ($title, $release_year, $artist_id)

    # Returns nothing
  end

  # deletes an album
  # 1 arg: id (number)
  def delete(id)
    # Executes the sql query:
    # DELETE FROM albums WHERE id = $id;

    # Returns nothing
  end

  # updates an album
  # 3 args: id (number) column (string), value (number | string)
  def update(id, column, value)
    # Executes the sql query:
    # UPDATE albums
    # SET $column = $value
    # WHERE id = $id;

    # Returns nothing
  end
end

# Table name: artists

# Model Class
# (in lib/artist.rb)
class Artist
  attr_accessor :id, :name, :genre
end

# Repository Class
# (in lib/artist_repository.rb)
class ArtistRepository
  # Gets a single record by its ID
  # One arg: id (number)
  def find(id)
    # Executes the sql query:
    # SELECT * from artists where id = $id;

    # Returns an artist object
  end

  # adds an artist
  # 3 args: name (string) genre (string)
  def create(name, genre)
    # Executes the sql query:
    # INSERT INTO artists (name, genre)
    # VALUES ($name, $genre);

    # Returns nothing
  end

  # deletes an artist
  # 1 arg: id (number)
  def delete(id)
    # Executes the sql query:
    # DELETE FROM artists WHERE id = $id;

    # Returns nothing
  end

  # updates an artist
  # 3 args: id (number) column (string), value (number | string)
  def update(id, column, value)
    # Executes the sql query:
    # UPDATE artists
    # SET $column = $value
    # WHERE id = $id;

    # Returns nothing
  end
end
```

## Write Test Examples

```ruby

# Album Repository Class
# 1 - Get all albums
repo = AlbumRepository.new

albums = repo.all

albums.length # => 11

albums[0].id # => 1
albums[0].title # => 'Doolittle'
albums[0].release_year # => 1989
albums[0].artist_id # => 1

albums[1].id # => 2
albums[1].title # => 'Surfer Rosa'
albums[1].release_year # => 1988
albums[1].artist_id # => 1

# 2 - Find an album
repo = AlbumRepository.new

album = repo.find(1)

album.id # => 1
album.title # => 'Doolittle'
album.release_year # => 1989
album.artist_id # => 1

# 3 - adds an album
repo = AlbumRepository.new

repo.create('Hot Pink', 2019, 99)

albums = repo.all

albums[-1].title # => 'Hot Pink'
albums[-1].release_year # => 2019
albums[-1].artist_id # => 99

# 4 - deletes an album
repo = AlbumRepository.new

albums = repo.all
albums.length # => 11

repo.delete(1)

albums = repo.all
albums.length # => 10

# 5 - updates an album
repo = AlbumRepository.new

repo.update(1, 'title', 'Doolittler')
album = repo.find(1)

album.title => # 'Doolittler'

# ------------------------------------------------------

# artist Repository Class
# 1 - Get all artists
repo = ArtistRepository.new

artists = repo.all

artists.length # => 5

artists[0].id # => 1
artists[0].name # => 'Pixies'
artists[0].genre # => 'Rock'

artists[1].id # => 2
artists[1].name # => 'Abba'
artists[1].release_year # => 'Pop'

# 2 - Find an artist
repo = ArtistRepository.new

artist = repo.find(1)

artist.id # => 1
artist.name # => 'Pixies'
artist.genre # => 'Rock'

# 3 - adds an artist
repo = ArtistRepository.new

repo.create('Doja Cat', 'Pop')

artists = repo.all

artists[-1].name # => 'Doja Cat'
artists[-1].genre # => 'Pop'

# 4 - deletes an artist
repo = ArtistRepository.new

artists = repo.all
artists.length # => 11

repo.delete(1)

artists = repo.all
artists.length # => 10

# 5 - updates an artist
repo = ArtistRepositoryxw.new

repo.update(1, 'Pixies', 'Smhixies')
album = repo.find(1)

album.title => # 'Shmixies'

```
