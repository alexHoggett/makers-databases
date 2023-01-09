TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (email_address, username) VALUES
('alex@gmail.com', 'alex95');
INSERT INTO users (email_address, username) VALUES('shaun@hotmail.co.uk', 'shaunMeister');

INSERT INTO posts (title, views, content, user_id) VALUES
('Blog 1', 2, 'Shauns dog is great', 1);
INSERT INTO posts (title, views, content, user_id) VALUES('Blog 2', 3, 'this is another blog', 2);
INSERT INTO posts (title, views, content, user_id) VALUES('Blog 3', 5, 'dear diary...', 1);