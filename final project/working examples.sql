# JOIN example - joins yardID with race table to see which yards have races with which horse and date
SELECT h.yardID, h.HorseName, r.Course, r.RaceCode, r.RaceDate
FROM horse h
INNER JOIN
race r
ON
h.HorseName = r.HorseName

#Subquery example - shows horses in training but NOT in a race
SELECT*
FROM horse
WHERE HorseName NOT IN
(SELECT DISTINCT HorseName
	FROM race);

#VIEWS example - shows which yard the trainer works from 
CREATE VIEW trainer_info
AS
SELECT
	f_name, surname, address, yardID, yard_name
    FROM person
    JOIN 
    trainer USING (personID) 
    JOIN
    yard USING (yardID);
    
SELECT * FROM trainer_info;
    
#STORED FUNCTION - to calculate horse's age
DELIMITER //

CREATE FUNCTION horse_age
(date1 date)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE date2 DATE;
		SELECT current_date() into date2;
        RETURN year(date2)-year(date1);
END
//

DELIMITER ;

SELECT HorseName, gender, horse_age(DOB) as 'age' from horse;

#STORED PROCEDURE - uses yardID to find horse info for each individual yard
CREATE PROCEDURE get_horse(yardID INT)
BEGIN
	IF yardID IS NULL THEN
		SELECT * FROM horse
	ELSE
		SELECT * FROM horse h
        WHERE h.yardID = yardID;
	END IF;
END

CALL get_horse(10);