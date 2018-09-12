CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username varchar(90) NOT NULL ,
  first_name varchar(90) NULL DEFAULT NULL,
  last_name varchar(90) NULL DEFAULT NULL,
  created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT current_timestamp,
  updated_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT current_timestamp
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY NOT NULL,
  title varchar(180) NULL DEFAULT NULL,
  url varchar(510) NULL DEFAULT NULL,
  content text NULL DEFAULT NULL,
  created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT current_timestamp,
  updated_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT current_timestamp
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  body varchar(510) NULL DEFAULT NULL,
  created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT current_timestamp,
  updated_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT current_timestamp
);

ALTER TABLE posts ADD user_id INTEGER NOT NULL;

ALTER TABLE posts ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE comments ADD user_id INTEGER NOT NULL;

ALTER TABLE comments ADD post_id INTEGER NOT NULL;

ALTER TABLE comments ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE comments ADD FOREIGN KEY (post_id) REFERENCES posts(id);

