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