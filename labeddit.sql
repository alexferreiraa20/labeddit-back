-- Active: 1681774702180@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    nick_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT DEFAULT "NORMAL" NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT(0) NOT NULL,
    dislikes INTEGER DEFAULT(0) NOT NULL,
    replies INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes_post (
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE comments (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT(0) NOT NULL,
    dislikes INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes_post_comment (
    user_id TEXT NOT NULL,
    comment_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (comment_id) REFERENCES comments(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO users (id, nick_name, email, password, created_at, role)
VALUES
	("113af54a-aa3b-4eef-8e24-aef405bb6dd5", "Alex Ferreira", "alex@email.com", "$2a$12$4lLkXYfh4QGgAKm3t9VSAue9k5pb37tJPx4ZehqOOQYuMiiEmMUkW","2023-02-10T14:48:00.000Z", "ADMIN"),
	("a11ff405-2d09-468a-9e4f-b32794c6b5b4", "Marina Rosas", "marina@email.com", "$$2a$12$6vCrNqv7lyfYnJegdOrq3.QfTD4AtIP58k8xoqxZMozNdPhQqEiXu", "2023-02-10T14:48:00.000Z", "NORMAL"),
    ("57c8e2a7-cb47-4cdd-8eaf-b8129b547634", "Elton Limeira", "elton@email.com", "$2a$12$dIw5ZRDJd5hYSQDEan6qB.cBfrWAGZhVtYuRwZbOfUEwz8GwrGtvi", "2023-02-10T14:48:00.000Z", "NORMAL"),
    ("277ab057-b590-4731-ac28-661fa342e270", "Eugenia Maria", "eugenia@email.com", "$2a$12$JAKhbnfbJbukrFq2T0ltDO0kh5hsHfWwgqRhYPe7GoLK2GedirMDi", "2023-02-10T14:48:00.000Z", "NORMAL");

INSERT INTO posts (id, creator_id, content, likes, dislikes, replies, created_at, updated_at)
VALUES
	("5bd2ca8f-948b-4e73-9804-68096f9ad38f", "113af54a-aa3b-4eef-8e24-aef405bb6dd5", "Maratonando série até dizer chega", 0, 0, 1, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z"),
	("55fc3f98-0449-4206-9145-882c51befbc1", "a11ff405-2d09-468a-9e4f-b32794c6b5b4", "Odeio POO", 0, 1, 1, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z"),
	("9edbb98e-f4d4-469b-a737-59baf052c88a", "57c8e2a7-cb47-4cdd-8eaf-b8129b547634", "Quero ficar rico logo com programação", 3, 1, 1, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z"),
	("9feaf731-0cc4-4dde-86bc-6b9a8c72a127", "277ab057-b590-4731-ac28-661fa342e270", "Foco nos estudos de UX/UI", 1, 0, 1, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z");

INSERT INTO likes_dislikes_post (user_id, post_id, like)
VALUES
	("113af54a-aa3b-4eef-8e24-aef405bb6dd5", "55fc3f98-0449-4206-9145-882c51befbc1", 0),
	("a11ff405-2d09-468a-9e4f-b32794c6b5b4", "9edbb98e-f4d4-469b-a737-59baf052c88a", 0),
	("113af54a-aa3b-4eef-8e24-aef405bb6dd5", "9edbb98e-f4d4-469b-a737-59baf052c88a", 1),
	("57c8e2a7-cb47-4cdd-8eaf-b8129b547634", "9edbb98e-f4d4-469b-a737-59baf052c88a", 1),
	("277ab057-b590-4731-ac28-661fa342e270", "9edbb98e-f4d4-469b-a737-59baf052c88a", 1),
	("57c8e2a7-cb47-4cdd-8eaf-b8129b547634", "9feaf731-0cc4-4dde-86bc-6b9a8c72a127", 1);


INSERT INTO comments (id, creator_id, post_id, content, likes, dislikes, created_at, updated_at)
VALUES
	("b00e24d9-c967-4437-9777-93d50e65046d", "113af54a-aa3b-4eef-8e24-aef405bb6dd5", "5bd2ca8f-948b-4e73-9804-68096f9ad38f", "Comentário interessante.", 1, 0, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z"),
	("5f3d89ab-07c3-44ca-ac8d-6053e03dc7c3", "a11ff405-2d09-468a-9e4f-b32794c6b5b4", "55fc3f98-0449-4206-9145-882c51befbc1", "Comentário inteligente.", 1, 0, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z"),
	("944b29f9-5a7c-4166-83f7-f9374436b289", "57c8e2a7-cb47-4cdd-8eaf-b8129b547634", "9edbb98e-f4d4-469b-a737-59baf052c88a", "Comentário desnecessário.", 1, 0, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z"),
	("a357aa0e-65b3-40e9-8f62-e9f5f6bf747e", "277ab057-b590-4731-ac28-661fa342e270", "9feaf731-0cc4-4dde-86bc-6b9a8c72a127", "Comentário bacana.", 1, 0, "2023-02-10T14:48:00.000Z", "2023-02-10T14:48:00.000Z");


INSERT INTO likes_dislikes_post_comment (user_id, comment_id, like)
VALUES
	("113af54a-aa3b-4eef-8e24-aef405bb6dd5", "b00e24d9-c967-4437-9777-93d50e65046d", 1),
	("a11ff405-2d09-468a-9e4f-b32794c6b5b4", "5f3d89ab-07c3-44ca-ac8d-6053e03dc7c3", 1),
	("113af54a-aa3b-4eef-8e24-aef405bb6dd5", "944b29f9-5a7c-4166-83f7-f9374436b289", 1),
	("57c8e2a7-cb47-4cdd-8eaf-b8129b547634", "a357aa0e-65b3-40e9-8f62-e9f5f6bf747e", 1);
	

SELECT * FROM users;

SELECT * FROM posts;

SELECT * FROM comments;

SELECT * FROM likes_dislikes_post;

SELECT * FROM likes_dislikes_post_comment;

DROP TABLE users;
DROP TABLE posts;
DROP TABLE likes_dislikes_post;

DROP TABLE likes_dislikes_post_comment;

DROP TABLE comments;

UPDATE posts
SET creator_id = "a11ff405-2d09-468a-9e4f-b32794c6b5b4"
WHERE id = "55fc3f98-0449-4206-9145-882c51befbc1";


SELECT * FROM posts
INNER JOIN comments
ON posts.id = comments.post_id;