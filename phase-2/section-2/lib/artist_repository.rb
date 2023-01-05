require_relative 'artist'

class ArtistRepository
  # Returns all records
  # No args
  def all
    sql = "SELECT * FROM artists;"
    result_set = DatabaseConnection.exec_params(sql, [])
    
    artists = []

    result_set.each do |record|
      artist = Artist.new
      artist.id = record['id'].to_i
      artist.name = record['name']
      artist.genre = record['genre']
      artists << artist
    end

    return artists
  end

  # Gets a single record by its ID
  # One arg: id (number)
  def find(id)
    sql = "SELECT * FROM artists WHERE id = #{id};"
    result_set = DatabaseConnection.exec_params(sql, [])

    artist = Artist.new
    artist.id = result_set[0]['id'].to_i
    artist.name = result_set[0]['name']
    artist.genre = result_set[0]['genre']

    return artist
  end

  # adds an artist
  def create(name, genre)
    sql = "INSERT INTO artists (name, genre)
          VALUES ('#{name}', '#{genre}');"
    DatabaseConnection.exec_params(sql, [])
  end

  # deletes an artist
  def delete(id)
    sql = "DELETE FROM artists WHERE id = #{id};"
    DatabaseConnection.exec_params(sql, [])
  end

  # updates an artist
  # 3 args: id (number) column (string), value (number | string)
  def update(id, column, value)
    sql = "UPDATE artists
           SET #{column} = '#{value}'
           WHERE id = #{id};"

    DatabaseConnection.exec_params(sql, [])
  end
end