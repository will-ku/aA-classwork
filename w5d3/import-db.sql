PRAGMA foreign_keys = ON

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Will','K')
    ('Marcus','Q');

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title,body,author_id)
SELECT 
    'Will K', 'THIS IS THE BODY', 1
FROM
    users
WHERE 
    user.fname = "Will" AND user.lname = "K";
INSERT INTO
    questions (title,body,author_id)
SELECT 
    'Marcus Q', 'THIS IS THE BODY', 2
FROM
    users
WHERE 
    user.fname = "Marcus" AND user.lname = "Q";




CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    follower_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id TEXT NOT NULL,
    reply_id INTEGER,
    body TEXT NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
    FOREIGN KEY (reply_id) REFERENCES replies(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL

    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

