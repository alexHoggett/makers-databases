require "post_repository"

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_posts_table
  end

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
  
    expect(post.title).to eq 'Blog 1'
    expect(post.views).to eq 2
  end

  it "Add a new post to the table" do
    repo = PostRepository.new
  
    post = Post.new
    post.title = 'Blog 12'
    post.views = 12
    post.content = 'This is my test blog ...'
    post.user_id = 1
    repo.create(post)
  
    posts = repo.all
  
    expect(posts.length).to eq 4
    expect(
      posts.any? { |record| record.title == post.title }
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
end