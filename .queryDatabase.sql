CREATE TABLE users (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL
);

CREATE TABLE guesses (
	"id" SERIAL PRIMARY KEY,
	"user_id" INTEGER NOT NULL REFERENCES "users"("id"),
	"match_id" INTEGER NOT NULL REFERENCES "matchs"("id"),
	"score_s1" INTEGER NOT NULL,
	"score_s2" INTEGER NOT NULL
);

CREATE TABLE matchs (
	"id" SERIAL PRIMARY KEY,
	"selection_1" INTEGER NOT NULL REFERENCES "selection"("id"),
	"selection_2" INTEGER NOT NULL REFERENCES "selection"("id"),
	"scoreboard_id" INTEGER NOT NULL REFERENCES "scoreboard"("id"),
	"winner" TEXT ,
	"tied" BOOLEAN NOT NULL DEFAULT 'false',
	"guesses_status" BOOLEAN NOT NULL DEFAULT 'true',
	"date" DATE NOT NULL
);

CREATE TABLE selection (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE scoreboard (
	"id" SERIAL PRIMARY KEY,
	"score_s1" INTEGER ,
	"score_s2" INTEGER 
);

-- scoreboard
INSERT INTO scoreboard (score_s1, score_s2) VALUES ();


-- matchs
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (1,2,1,'2022-11-20');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (3,4,2,'2022-11-21');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (5,6,3,'2022-11-21');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (7,8,4,'2022-11-21');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (9,10,5,'2022-11-22');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (11,12,6,'2022-11-22');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (13,14,7,'2022-11-24');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (13,15,8,'2022-11-28');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (13,16,9,'2022-12-02');
INSERT INTO matchs (selection_1, selection_2, scoreboard_id, date) VALUES (13,9,10,'2022-12-20');

-- selection
INSERT INTO selection (name) VALUES ('Catar');
INSERT INTO selection (name) VALUES ('Equador');
INSERT INTO selection (name) VALUES ('Inglaterra');
INSERT INTO selection (name) VALUES ('Irã');
INSERT INTO selection (name) VALUES ('Senegal');
INSERT INTO selection (name) VALUES ('Holanda');
INSERT INTO selection (name) VALUES ('Estados Unidos');
INSERT INTO selection (name) VALUES ('Gales');
INSERT INTO selection (name) VALUES ('Argentina');
INSERT INTO selection (name) VALUES ('Arábia Saudita');
INSERT INTO selection (name) VALUES ('Dinamarca');
INSERT INTO selection (name) VALUES ('Tunísia');
INSERT INTO selection (name) VALUES ('Brasil');
INSERT INTO selection (name) VALUES ('Sérvia');
INSERT INTO selection (name) VALUES ('Suíça');
INSERT INTO selection (name) VALUES ('Camarôes');

-- users
INSERT INTO users (name, email) VALUES ('Joaquim', 'joaquim@email.com');
INSERT INTO users (name, email) VALUES ('Maria', 'maria@email.com');
