require 'book_repository'

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  it "returns all records" do

  end
end