DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone DEFAULT NULL,
  completed BOOLEAN NOT NULL DEFAULT false
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp without time zone NULL DEFAULT NULL;

ALTER TABLE tasks ALTER updated_at SET NOT NULL;

ALTER TABLE tasks ALTER updated_at SET DEFAULT NOW();

INSERT INTO tasks
VALUES(default , 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks(title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT tilte
FROM tasks
WHERE completed_at IS NULL

UPDATE tasks SET completed_at = NOW();WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE tasks IS NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks(title, description)
VALUES ('mistake 1', 'a test entry'),('mistake 2', 'another test entry'),('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;