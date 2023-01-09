require 'post'

class PostRepository
  def all
    sql = "SELECT * FROM posts"
    result_set = DatabaseConnection.exec_params(sql, [])

    posts = []
        
    result_set.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.title = record['title']
      post.views = record['views']
      post.content = record['content']
      post.user_id = record['user_id']
      posts << post
    end
    return posts
  end

  def find(id)
    sql = "SELECT * FROM posts WHERE id = $1"
    params = [id]
    record = DatabaseConnection.exec_params(sql, params)

    post = Post.new
    post.id = record[0]['id'].to_i
    post.title = record[0]['title']
    post.views = record[0]['views'].to_i
    post.content = record[0]['content']
    post.user_id = record[0]['user_id']
    return post
  end

  def delete(id)
    sql = "DELETE FROM posts WHERE id = $1"
    params = [id]
    DatabaseConnection.exec_params(sql, params)
  end

  # take a post object
  def create(post)
    sql = "INSERT INTO posts (title, views, content, user_id) VALUES ($1, $2, $3, $4)"
    params = [post.title, post.views, post.content, post.user_id]
    DatabaseConnection.exec_params(sql, params)
  end
end