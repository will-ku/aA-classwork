DROP TABLE if exists question_likes;
DROP TABLE if exists replies;
DROP TABLE if exists question_follows;
DROP TABLE if exists questions;
DROP TABLE if exists users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Will','K'),
    ('Marcus','Q');

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title,body,author_id)
SELECT 
    'Will K Question', 'THIS IS THE BODY', 1
FROM
    users
WHERE 
    users.fname = "Will" AND users.lname = "K";
INSERT INTO
    questions (title,body,author_id)
SELECT 
    'Marcus Q Question', 'THIS IS THE BODY', 2
FROM
    users
WHERE 
    users.fname = "Marcus" AND users.lname = "Q";


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    follower_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

INSERT INTO
    question_follows(question_id,follower_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Will" AND lname = "K"),
  (SELECT id FROM questions WHERE title = "Will K Question")),

  ((SELECT id FROM users WHERE fname = "Marcus" AND lname = "Q"),
  (SELECT id FROM questions WHERE title = "Marcus Q Question")
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    reply_id INTEGER,
    body TEXT NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  replies (question_id, author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "Marcus Q Question"),
  (SELECT id FROM users WHERE fname = "Marcus" AND lname = "Q"),
  "What color is your car?");

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Marcus" AND lname = "Q"),
  (SELECT id FROM questions WHERE title = "Marcus Q Question"));
