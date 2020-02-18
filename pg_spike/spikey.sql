\c postgres

  DROP DATABASE IF EXISTS tokenhub;
CREATE DATABASE tokenhub;

\c tokenhub

CREATE TABLE tokens (
    PRIMARY KEY (id),
    id          SERIAL,
    name        TEXT NOT NULL,
    value       TEXT NOT NULL,
    list_id     INTEGER,
    category_id INTEGER
);

CREATE TABLE lists (
    PRIMARY KEY (id),
    id          SERIAL,
    name        TEXT NOT NULL
);

CREATE TABLE categories (
    PRIMARY KEY (id),
    id          SERIAL,
    name        TEXT NOT NULL
);
