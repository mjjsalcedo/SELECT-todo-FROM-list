DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app WITH OWNER michael;

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