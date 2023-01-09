-- Nouns:
-- users
-- eamil address
-- username

-- timeline
-- posts
-- user account

-- Posts:
-- id
-- title
-- content
-- views
-- user account

-- Users:
-- id
-- email addresss
-- username


-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   email_address text,
--   username text
-- );

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  views int,
  content text,
  user_id int,
  constraint fk_user foreign key (user_id)
    references users(id) 
    on delete cascade
);

TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (email_address, username) VALUES
('alex@gmail.com', 'alex95');
INSERT INTO users (email_address, username) VALUES('shaun@hotmail.co.uk', 'shaunMeister');

INSERT INTO posts (title, views, content, user_id) VALUES
('Blog 1', 2, 'Shauns dog is great', 1);
INSERT INTO posts (title, views, content, user_id) VALUES('Blog 2', 3, 'this is another blog', 2);
INSERT INTO posts (title, views, content, user_id) VALUES('Blog 3', 5, 'dear diary...', 1);

