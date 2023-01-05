require 'book_repository'

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  it "returns all records" do
    repo = BookRepository.new
    books = repo.all

    expect(books[0].title).to eq 'Lanark'
    expect(books[0].author_name).to eq 'Alasdair Gray'

    expect(books[1].id).to eq 2
    expect(books[1].title).to eq 'Dubliners'
    expect(books[1].author_name).to eq 'James Joyce'
  end

  it "gets a single book by its ID" do
    repo = BookRepository.new
    book = repo.find(1)

    expect(book.id).to eq 1
    expect(book.title).to eq 'Lanark'
    expect(book.author_name).to eq 'Alasdair Gray'
  end

  it "adds a book to the table" do
    repo = BookRepository.new

    book = Book.new
    book.title = 'Burning Patience'
    book.author_name = 'Antonio Skarmeta'
    
    repo.create(book)
    
    books = repo.all
    expect(books[-1].title).to eq 'Burning Patience'
    expect(books[-1].author_name).to eq 'Antonio Skarmeta'
  end

  repo = BookRepository.new

  it "Updates a book in the table" do
    repo.update(1, 'title', 'Scolding Patience')
    book = repo.find(1)
    expect(book.title).to eq 'Scolding Patience'
  end

  it "deletes a book from the table" do
    repo = BookRepository.new
    expect(repo.all.length).to eq 2
    repo.delete(1)
    books = repo.all
    expect(books.length).to eq 1
    expect(books[0].id).to eq 2
  end
end