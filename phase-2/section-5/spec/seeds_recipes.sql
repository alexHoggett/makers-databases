TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Spaghetti', 10, 7);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Dolma', 120, 10);