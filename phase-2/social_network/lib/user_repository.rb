require "user"

class UserRepository
  def all
  # runs SQL query
  # SELECT * FROM users
    sql = "SELECT * FROM users"
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
      
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.email_address = record['email_address']
      user.username = record['username']
      users << user
    end
    return users
  end

  def find(id)
    sql = "SELECT * FROM users WHERE id = $1"
    params = [id]
    record = DatabaseConnection.exec_params(sql, params)

    user = User.new
    user.id = record[0]['id'].to_i
    user.email_address = record[0]['email_address']
    user.username = record[0]['username']
    return user
  end

  def delete(id)
    sql = "DELETE FROM users WHERE id = $1"
    params = [id]
    DatabaseConnection.exec_params(sql, params)
  end

  # take a user object
  def create(user)
    sql = "INSERT INTO users (username, email_address) VALUES ($1, $2)"
    params = [user.username, user.email_address]
    DatabaseConnection.exec_params(sql, params)
  end
end