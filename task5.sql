ALTER TABLE students ADD CONSTRAINT UNIQUE (name);

CREATE TRIGGER before_student_insert
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);
    -- Check if the student name already exists
    IF EXISTS (SELECT 1 FROM students WHERE name = NEW.name) THEN
        SET msg = CONCAT('Error: A student with the name ', NEW.name, ' already exists.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END