require "user_repository"

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_users_table
  end

  it "Returns all users" do
    repo = UserRepository.new
    users = repo.all
    p users
    expect(users.length).to eq 2
    expect(users[0].id).to eq 1
    expect(users[0].username).to eq 'alex95'
  end

  it "Returns a given user by its ID" do
    repo = UserRepository.new
  
    user = repo.find(1)
  
    expect(user.email_address).to eq 'alex@gmail.com'
    expect(user.username).to eq 'alex95'
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
end