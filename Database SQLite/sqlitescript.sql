-- create and open the database
.open project1mps.db

-- enable foreign keys
PRAGMA foreign_keys = ON;

-- create the tables
CREATE TABLE person (
	person_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	phone TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL,
	function TEXT NOT NULL
);

CREATE TABLE participant (
	participant_id INTEGER PRIMARY KEY,
	name_team TEXT NOT NULL,
	name_member_1 TEXT NOT NULL,
	name_member_2 TEXT NOT NULL
);

CREATE TABLE round (
	round_id INTEGER PRIMARY KEY,
	round_no INTEGER NOT NULL,
	participant_id INTEGER NOT NULL,
	FOREIGN KEY (participant_id) REFERENCES person(person_id)
);

CREATE TABLE competition (
	competition_id INTEGER PRIMARY KEY,
	name_competition TEXT NOT NULL,
	location TEXT NOT NULL,
	round_id INTEGER NOT NULL,
	participant_id INTEGER NOT NULL,
	jury_id INTEGER NOT NULL,
	organizer_id INTEGER NOT NULL,
	FOREIGN KEY (round_id) REFERENCES round(round_id),
	FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
	FOREIGN KEY (jury_id) REFERENCES person(person_id),
	FOREIGN KEY (organizer_id) REFERENCES person(person_id)
);

-- populate tables with some mock data


