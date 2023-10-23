CREATE TABLE "doctor" (
  "id" integer PRIMARY KEY,
  "rank" integer,
  "area" varchar
);

CREATE TABLE "patient" (
  "patient_nr" integer PRIMARY KEY,
  "name" varchar,
  "disease" varchar
);

CREATE TABLE "treats" (
  "id" integer PRIMARY KEY,
  "doctor_id" integer,
  "patient_nr" integer
);

CREATE TABLE "admission" (
  "id" integer PRIMARY KEY,
  "from" varchar,
  "to" varchar,
  "patient_nr" integer
);

CREATE TABLE "room" (
  "room_nr" integer PRIMARY KEY,
  "from" varchar,
  "to" varchar,
  "admission_id" integer
);

CREATE TABLE "room_beds" (
  "id" integer PRIMARY KEY,
  "room_nr" integer,
  "beds_id" integer
);

CREATE TABLE "beds" (
  "id" integer PRIMARY KEY
);

CREATE TABLE "station" (
  "stat_nr" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "has" (
  "stat_nr" integer,
  "room_nr" integer,
  PRIMARY KEY ("stat_nr", "room_nr")
);

CREATE TABLE "station_personell" (
  "pers_nr" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "works_for" (
  "stat_nr" integer,
  "pers_nr" integer,
  PRIMARY KEY ("stat_nr", "pers_nr")
);

CREATE TABLE "caregiver" (
  "qualification" varchar PRIMARY KEY
);

CREATE TABLE "is_a" (
  "id" integer PRIMARY KEY,
  "station_personell_pers_nr" integer,
  "caregiver_qualification" integer,
  "doctor_id" integer
);

ALTER TABLE "treats" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctor" ("id");

ALTER TABLE "treats" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");

ALTER TABLE "room" ADD FOREIGN KEY ("admission_id") REFERENCES "admission" ("id");

ALTER TABLE "room_beds" ADD FOREIGN KEY ("room_nr") REFERENCES "room" ("room_nr");

ALTER TABLE "room_beds" ADD FOREIGN KEY ("beds_id") REFERENCES "beds" ("id");

ALTER TABLE "has" ADD FOREIGN KEY ("room_nr") REFERENCES "room" ("room_nr");

ALTER TABLE "has" ADD FOREIGN KEY ("stat_nr") REFERENCES "station" ("stat_nr");

ALTER TABLE "works_for" ADD FOREIGN KEY ("stat_nr") REFERENCES "station" ("stat_nr");

ALTER TABLE "works_for" ADD FOREIGN KEY ("pers_nr") REFERENCES "station_personell" ("pers_nr");

ALTER TABLE "is_a" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctor" ("id");

ALTER TABLE "is_a" ADD FOREIGN KEY ("station_personell_pers_nr") REFERENCES "station_personell" ("pers_nr");

ALTER TABLE "is_a" ADD FOREIGN KEY ("caregiver_qualification") REFERENCES "caregiver" ("qualification");
