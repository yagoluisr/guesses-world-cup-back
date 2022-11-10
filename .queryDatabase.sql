CREATE TABLE users (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL
);

CREATE TABLE guesses (
	"id" SERIAL PRIMARY KEY,
	"user_id" INTEGER NOT NULL REFERENCES "users"("id"),
	"match_id" INTEGER NOT NULL REFERENCES "matches"("id"),
	"score_s1" INTEGER NOT NULL,
	"score_s2" INTEGER NOT NULL
);

CREATE TABLE matches (
	"id" SERIAL PRIMARY KEY,
	"selection_1" INTEGER NOT NULL REFERENCES "selection"("id"),
	"selection_2" INTEGER NOT NULL REFERENCES "selection"("id"),
	"scoreboard_id" INTEGER NOT NULL REFERENCES "scoreboard"("id"),
	"winner" TEXT NOT NULL,
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
	"score_s1" INTEGER NOT NULL,
	"score_s2" INTEGER NOT NULL
);