#CREATE DATABASE HorseRacing;
USE HorseRacing;

CREATE TABLE Race
(RaceDate date NOT NULL,
Course VARCHAR(50),
HorseName VARCHAR(50),
RaceCode char(2));

CREATE TABLE Horse
(yardID INT NOT NULL,
HorseName VARCHAR(50) NOT NULL,
regNUM INT,
gender VARCHAR(10),
DOB DATE,
date_bought DATE,
type VARCHAR(50));

CREATE TABLE Trainer
(yardID INT NOT NULL,
personID INT,
regNUM INT PRIMARY KEY);

CREATE TABLE Owner
(personID INT,
regNUM INT PRIMARY KEY);

CREATE TABLE Person
(personID INT PRIMARY KEY,
f_name VARCHAR(50) NOT NULL,
surname VARCHAR (50) NOT NULL,
address VARCHAR(50),
phone INT);

CREATE TABLE Yard
(yardID INT NOT NULL,
yard_name VARCHAR(50),
regNUM INT NOT NULL);
