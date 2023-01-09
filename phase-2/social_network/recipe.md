```ruby
class Post
    attr_accessor :id, :title, :content, :views, :user_id
end

class User
    attr_accessor :id, :email_address, :usernmae
end

class PostRepository
  def all
  # runs SQL query
  # SELECT * FROM posts
  end

  def find(id)
    # runs SQL query
    # SELECT * FROM posts WHERE id = $1
  end

  def delete(id)
  # runs SQL query
  # DELETE FROM posts WHERE od = $1
  end

  # take a post object
  def create(post)
  # runs SQL query
  # INSERT INTO posts VALUES (post)
  end
end

class UserRepository
  def all
  # runs SQL query
  # SELECT * FROM users
  end

  def find(id)
    # runs SQL query
    # SELECT * FROM users WHERE id = $1
  end

  def delete(id)
  # runs SQL query
  # DELETE FROM users WHERE od = $1
  end

  # take a user object
  def create(user)
  # runs SQL query
  # INSERT INTO users VALUES (user)
  end
end
```

## TESTS

```ruby
it "Returns all users" do
  repo = UserRepository.new

  users = repo.all

  expect(users.length).to eq 2
  expect(users[0].id).to eq = 1
  expect(users[0].username).to eq = 'alex95'
end

it "Returns a given user by its ID" do
  repo = UserRepository.new

  user = repo.find(1)

  expect(user.length).to eq 1
  expect(user.email_address).to eq 'alex@gmail.com'
  expect(user.username).to eq = 'alex95'
end

it "Add a new user to the table" do
  repo = UserRepository.new

  user = User.new
  user.username = 'Baghdad_bad_boy'
  user.email_address = 'ali@hotmail.com'
  repo.create(user)

  users = repo.all

  expect(users.length).to eq 3
  expect(
    users.any? { |record| record.email_address == user.email_address }
  ).to eq true
end

it "deletes a user from the table" do
  repo = UserRepository.new

  repo.delete(1)

  users = repo.all

  expect(users.length).to eq 1
  expect(
    users.any? { |record| record.email_address == 'alex@gmail.com' }
  ).to eq false
end

# # # # # Posts

it "Returns all posts" do
  repo = PostRepository.new

  posts = repo.all

  expect(posts.length).to eq 3
  expect(posts[0].id).to eq 1
  expect(posts[0].title).to eq 'Blog 1'
end

it "Returns a post by its ID" do
  repo = PostRepository.new

  post = repo.find(1)

  expect(post.length).to eq 1
  expect(post.title).to eq 'Blog 1'
  expect(post.views).to eq = 2
end

it "Add a new post to the table" do
  repo = PostRepository.new

  post = User.new
  post.title = 'Blog 12'
  post.views = 12
  post.content = 'This is my test blog ...'
  repo.create(post)

  posts = repo.all

  expect(posts.length).to eq 4
  expect(
    posts.any? { |record| record.title == user.title }
  ).to eq true
end

it "deletes a post from the table" do
  repo = PostRepository.new

  repo.delete(1)

  posts = repo.all

  expect(posts.length).to eq 2
  expect(
    posts.any? { |record| record.title == 'Blog 1' }
  ).to eq false
end
```
