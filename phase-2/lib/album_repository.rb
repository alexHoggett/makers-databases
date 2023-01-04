require "album"

class AlbumRepository
  # Selecting all records
  # No argumuments
  def all
    # Executes the sql query:
    sql = "SELECT * FROM albums"
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |record|
      album = Album.new
      album.id = record['id'].to_i
      album.title = record['title']
      album.release_year = record['release_year'].to_i
      album.artist_id = record['artist_id'].to_i
      albums << album
    end

    return albums
  end

  # Gets a single record by its ID
  # One arg: id (number)
  def find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    result_set = DatabaseConnection.exec_params(sql, [])

    album = Album.new
    album.id = result_set[0]['id'].to_i
    album.title = result_set[0]['title']
    album.release_year = result_set[0]['release_year'].to_i
    album.artist_id = result_set[0]['artist_id'].to_i

    return album
  end

  # adds an album
  # 3 args: title (string) release_year (number) artist_id (number)
  def create(title, release_year, artist_id)
    sql = "INSERT INTO albums (title, release_year, artist_id)
          VALUES ('#{title}', #{release_year}, #{artist_id});"
    DatabaseConnection.exec_params(sql, [])
  end

  # deletes an album
  # 1 arg: id (number)
  def delete(id)
    sql = "DELETE FROM albums WHERE id = #{id};"
    DatabaseConnection.exec_params(sql, [])
  end

  # updates an album
  # 3 args: id (number) column (string), value (number | string)
  def update(id, column, value)
    sql = "UPDATE albums
           SET #{column} = '#{value}'
           WHERE id = #{id};"

    DatabaseConnection.exec_params(sql, [])
  end
end