ALTER TABLE horse
ADD constraint HorseName_pk
PRIMARY KEY (HorseName);

ALTER TABLE yard
ADD constraint yard_pk
PRIMARY KEY (yardID);

ALTER TABLE trainer
ADD FOREIGN KEY (yardID) REFERENCES yard(yardID);

ALTER TABLE horse
ADD FOREIGN KEY (yardID) REFERENCES yard(yardID);

ALTER TABLE owner
ADD FOREIGN KEY (personID) REFERENCES person(personID);

ALTER TABLE trainer
ADD FOREIGN KEY (personID) REFERENCES person(personID);