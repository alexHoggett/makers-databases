require 'Book'

class BookRepository
  def all
    sql = "SELECT * FROM books"
    result_set = DatabaseConnection.exec_params(sql, [])

    books = []

    result_set.each do |record|
      book = Book.new
      book.id = record['id'].to_i
      book.title = record['title']
      book.author_name = record['author_name']
      books << book
    end

    return books
  end

  def find(id)
    sql = "SELECT * FROM books WHERE id = #{id}"
    result_set = DatabaseConnection.exec_params(sql, [])

    book = Book.new
    book.id = result_set[0]['id'].to_i
    book.title = result_set[0]['title']
    book.author_name = result_set[0]['author_name']
    return book
  end

  def create(book)
    sql = "INSERT INTO books (title, author_name) VALUES ('#{book.title}', '#{book.author_name}')"
    result_set = DatabaseConnection.exec_params(sql, [])
  end

  def update (id, column, value)
    sql = "UPDATE books
           SET #{column} = '#{value}'
           WHERE id = #{id};"

    DatabaseConnection.exec_params(sql, [])
  end

  def delete(id)
    sql = "DELETE FROM books WHERE id = #{id};"
    DatabaseConnection.exec_params(sql, [])
  end
end