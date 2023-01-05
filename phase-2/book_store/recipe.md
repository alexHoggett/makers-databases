## 3 Define class names

```ruby
# Model class
# in lib/books.rb
class Book
end

# Repo class
# in lib/books_repository.rb
class BookRepository
end
```

## 4 Implement the Model Class

```ruby
class Book
  attr_accessor :id, :title, :author_name
end
```

## 5 Define the repository class interface

```ruby
class BookRepository

  # selects all records
  def all
    # runs sql query: SELECT * FROM books;
    # returns an array of Book objects
  end

  # returns a book by its id
  def find(id)
    # runs sql query: SELECT * FROM books WHERE id = $id;
    # returns a Book object
  end

  # adds a book to the table
  def create(book)
    # runs the sql query:
    # INSERT INTO books (title, author_name)
    # VALUES ($book.title, $book.author_name);

    # returns nothing
  end

  # updates a record
  def update(id, column, value)
  # runs sql query:
  # UPDATE BOOKS
  # SET $column = $value
  # WHERE id = $id;

  # returns nothing
  end

  # deletes a record from the table
  def delete(id)
    # runs sql query:
    # DELETE FROM books WHERE id = $id

    # returns nothing
  end

end
```

## Test Examples

```ruby
# get all book
repo = BookRepository.new
books = repo.all

expect(books[0].id).to eq 1
expect(books[0].title).to eq 'Lanark'
expect(books[0].author_name).to eq 'Alasdair Gray'

expect(books[1].id).to eq 2
expect(books[1].title).to eq 'Dubliners'
expect(books[1].author_name).to eq 'James Joyce'

# get a single book
repo = BookRepository.new
book = repo.find(1)

expect(book.id).to eq 1
expect(book.title).to eq 'Lanark'
expect(book.author_name).to eq 'Alasdair Gray'

# adds a book to the table
repo = BookRepository

book = Book.new
book.title = 'Burning Patience'
book.author_name = 'Antonio Skarmeta'

repo.create(book)

books = repo.all
expect(books[-1].title).to eq 'Burning Patience'
expect(books[-1].author_name).to eq 'Antonio Skarmeta'

# Update a books title
repo = BookRepository.new

repo.update(1, 'title', 'Scolding Patience')
book = repo.find(1)
expect(book.title).to eq 'Scolding Patience'

# Delete a book from the table
repo = BookRepository.new

expect(repo.all.length).to eq 2
repo.delete(1)
books = repo.all
expect(books.length).to eq 1
expect(books[0].id).to eq 2
```
