DROP DATABASE IF EXISTS PFMS;
CREATE DATABASE PFMS;
USE PFMS;

CREATE TABLE Trainer (
    TrainerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Mobile VARCHAR(20),
    Email_id VARCHAR(100)
);

INSERT INTO Trainer (TrainerID, Name, Mobile, Email_id) 
VALUES 
(1, 'John Smith', '1234567890', 'john.smith@example.com'),
(2, 'Sarah Johnson', '2345678901', 'sarah.johnson@example.com'),
(3, 'Mike Brown', '3456789012', 'mike.brown@example.com'),
(4, 'Emily Davis', '4567890123', 'emily.davis@example.com'),
(5, 'David Lee', '5678901234', 'david.lee@example.com'),
(6, 'Amanda Green', '6789012345', 'amanda.green@example.com'),
(7, 'Chris Wilson', '7890123456', 'chris.wilson@example.com'),
(8, 'Jessica Turner', '8901234567', 'jessica.turner@example.com'),
(9, 'Mark Garcia', '9012345678', 'mark.garcia@example.com'),
(10, 'Karen Taylor', '0123456789', 'karen.taylor@example.com');

CREATE TABLE User (
    UserID int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(100),
    Gender ENUM('M','F'),
    DOB date,
    Email_id varchar(100),
    Mobile varchar(20),
    Goal varchar(100),
    TrainerID int,
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

INSERT INTO User (UserID, Name, Gender, DOB, Email_id, Mobile, Goal, TrainerID)
VALUES
    (1, 'John Doe', 'M', '1990-01-01', 'johndoe@example.com', '1234567890', 'Lose weight', 1),
    (2, 'Jane Smith', 'F', '1992-05-05', 'janesmith@example.com', '0987654321', 'Build muscle', 1),
    (3, 'Mike Johnson', 'M', '1985-11-15', 'mikejohnson@example.com', '5555555555', 'Maintain weight', 2),
    (4, 'Sara Brown', 'F', '1998-02-28', 'sarabrown@example.com', '1111111111', 'Lose weight', 2),
    (5, 'Tom Wilson', 'M', '1978-08-10', 'tomwilson@example.com', '9999999999', 'Build endurance', 3),
    (6, 'Rachel Lee', 'F', '1995-03-22', 'rachellee@example.com', '7777777777', 'Build muscle', 4),
    (7, 'David Kim', 'M', '1989-07-13', 'davidkim@example.com', '2222222222', 'Lose weight', 5),
    (8, 'Amy Chen', 'F', '1983-12-30', 'amychen@example.com', '3333333333', 'Maintain weight', 6),
    (9, 'Mark Davis', 'M', '1991-09-08', 'markdavis@example.com', '4444444444', 'Build muscle', 7),
    (10, 'Emily Brown', 'F', '1997-04-18', 'emilybrown@example.com', '6666666666', 'Lose weight', 7);
    
CREATE TABLE Meal (
  MealID int primary key AUTO_INCREMENT,
  Name varchar(100),
  Calories int,
  Carbs int,
  Fats int,
  Proteins int
);

INSERT INTO Meal (MealID, Name, Calories, Carbs, Fats, Proteins)
VALUES (1, 'Chicken breast with quinoa and green beans', 450, 30, 12, 50),
       (2, 'Salmon with brown rice and broccoli', 500, 35, 18, 40),
       (3, 'Tofu stir-fry with rice noodles', 400, 40, 10, 30),
       (4, 'Grilled steak with sweet potato and asparagus', 550, 45, 22, 40),
       (5, 'Egg white omelette with spinach and whole wheat toast', 350, 30, 10, 25),
       (6, 'Greek yogurt with mixed berries and honey', 200, 25, 3, 20),
       (7, 'Black bean and vegetable chili with brown rice', 450, 60, 12, 25),
       (8, 'Oven-roasted turkey breast with roasted vegetables', 400, 30, 18, 35),
       (9, 'Grilled salmon with asparagus and quinoa', 450, 30, 20, 40),
       (10, 'Veggie burger with avocado and sweet potato fries', 500, 50, 15, 25);
    
    
CREATE TABLE DietPlan (
    DietID int PRIMARY KEY AUTO_INCREMENT,
    Protein_goal int,
    Carbs_goal int,
    Calorie_goal int,
    Fat_goal int, 
    MEALID int,
    FOREIGN KEY (MealID) REFERENCES Meal(MealID)
);

INSERT INTO DietPlan (DietID, Protein_goal, Carbs_goal, Calorie_goal, Fat_goal, MealID)
VALUES
    (1, 120, 200, 1800, 60, 1),
    (2, 150, 250, 2200, 70, 1),
    (3, 100, 150, 1600, 50, 5),
    (4, 130, 220, 2000, 65, 2),
    (5, 110, 180, 1700, 55, 5),
    (6, 140, 240, 2100, 75, 8),
    (7, 90, 130, 1500, 40, 7),
    (8, 125, 210, 1900, 62, 10),
    (9, 115, 190, 1750, 58, 6),
    (10, 135, 230, 2050, 72, 1);
    
    
CREATE TABLE FitnessPlan (
    PlanID int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(100),
    Goal varchar(100),
    DietPlanID int,
    FOREIGN KEY (DietPlanID) REFERENCES DietPlan(DietID)
);

INSERT INTO FitnessPlan (PlanID, Name, Goal, DietPlanID)
VALUES
    (1, 'Weight Loss Plan', 'Lose weight', 1),
    (2, 'Muscle Building Plan', 'Build muscle', 1),
    (3, 'Endurance Building Plan', 'Build endurance', 2),
    (4, 'Maintenance Plan', 'Maintain weight', 3),
    (5, 'Flexibility Plan', 'Improve flexibility', 4),
    (6, 'Strength Building Plan', 'Build strength', 5),
    (7, 'Cardiovascular Plan', 'Improve cardiovascular health', 6),
    (8, 'Sports-Specific Plan', 'Improve performance in a specific sport', 7),
    (9, 'Bodyweight Training Plan', 'Build strength without equipment', 8),
    (10, 'Functional Fitness Plan', 'Improve everyday movement patterns', 9);


    


CREATE TABLE WorkoutRoutine (
  RoutineID int primary key AUTO_INCREMENT,
  Name varchar(100),
  Calories_burnt int
);

INSERT INTO WorkoutRoutine (RoutineID, Name, Calories_burnt) 
VALUES (1, 'Morning Run', 300),
       (2, 'Evening Yoga', 200),
       (3, 'Weightlifting', 400),
       (4, 'Swimming', 500),
       (5, 'Pilates', 250),
       (6, 'Cycling', 350),
       (7, 'Hiking', 450),
       (8, 'Zumba', 275),
       (9, 'Boxing', 450),
       (10, 'Rowing', 375);
       

CREATE TABLE Exercise (
  ExerciseID int primary key AUTO_INCREMENT,
  Name varchar(100),
  Calories_burnt int
);

INSERT INTO Exercise (ExerciseID, Name, Calories_burnt)
VALUES (1, 'Push-ups', 100),
       (2, 'Pull-ups', 120),
       (3, 'Squats', 80),
       (4, 'Lunges', 90),
       (5, 'Bicep curls', 70),
       (6, 'Tricep dips', 80),
       (7, 'Sit-ups', 60),
       (8, 'Plank', 50),
       (9, 'Jumping jacks', 100),
       (10, 'Burpees', 120);
       
CREATE TABLE Record (
  RecordID int primary key AUTO_INCREMENT,
  Date date,
  Height int,
  Weight int,
  Muscle_mass int,
  Body_fat int,
  UserID int,
  MealID int,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (MealID) REFERENCES Meal(MealID)
);

INSERT INTO Record (RecordID, Date, Height, Weight, Muscle_mass, Body_fat, UserID, MealID)
VALUES
(1, '2023-04-10', 170, 70, 60, 20, 1, 1),
(2, '2023-04-09', 165, 75, 58, 21, 2, 2),
(3, '2023-04-08', 175, 80, 62, 18, 1, 3),
(4, '2023-04-07', 172, 70, 61, 19, 3, 4),
(5, '2023-04-06', 168, 68, 59, 22, 4, 5),
(6, '2023-04-05', 180, 85, 65, 17, 5, 6),
(7, '2023-04-04', 173, 73, 62, 20, 5, 7),
(8, '2023-04-03', 170, 70, 60, 20, 6, 8),
(9, '2023-04-02', 175, 80, 62, 18, 7, 9),
(10, '2023-04-01', 168, 68, 59, 22, 8, 10);

       
CREATE TABLE User_FitnessPlan (
  UserID INT NOT NULL,
  FitnessPlanID INT NOT NULL,
  Status ENUM("Active", "Not Active"),
  PRIMARY KEY (UserID, FitnessPlanID),
  FOREIGN KEY (FitnessPlanID) REFERENCES FitnessPlan(PlanID)
);


INSERT INTO User_FitnessPlan (UserID, FitnessPlanID, Status)
VALUES
(1, 2, 'Active'),
(1, 3, 'Not Active'),
(2, 1, 'Active'),
(2, 4, 'Not Active'),
(3, 1, 'Not Active'),
(3, 2, 'Not Active'),
(4, 3, 'Not Active'),
(4, 4, 'Active'),
(5, 2, 'Not Active'),
(5, 1, 'Not Active');


CREATE TABLE FitnessPlan_WorkoutRoutine (
    FitnessPlanID INT,
    WorkoutRoutineID INT,
    FOREIGN KEY (FitnessPlanID) REFERENCES FitnessPlan (PlanID),
    FOREIGN KEY (WorkoutRoutineID) REFERENCES WorkoutRoutine (RoutineID)
);

INSERT INTO FitnessPlan_WorkoutRoutine (FitnessPlanID, WorkoutRoutineID)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 4),
    (6, 5),
    (7, 6),
    (8, 7),
    (9, 8),
    (10, 9);

CREATE TABLE WorkoutRoutine_Exercise (
    WorkoutRoutineID INT,
    ExerciseID INT,
    PRIMARY KEY (WorkoutRoutineID, ExerciseID),
    FOREIGN KEY (WorkoutRoutineID) REFERENCES WorkoutRoutine(RoutineID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

INSERT INTO WorkoutRoutine_Exercise (WorkoutRoutineID, ExerciseID)
VALUES (1, 1), (1, 2), (1, 3),
       (2, 4), (2, 5),
       (3, 6), (3, 7), (3, 8),
       (4, 9), (4, 10);



CREATE TABLE Supplements (
  MealID int,
  Supplement_name varchar(100),
  PRIMARY KEY (MealID, Supplement_name),
  FOREIGN KEY (MealID) REFERENCES Meal(MealID)
);

INSERT INTO Supplements (MealID, Supplement_name) 
VALUES 
    (1, 'Whey protein'), 
    (1, 'Creatine'),
    (2, 'Multivitamin'),
    (3, 'Fish oil'),
    (3, 'Vitamin D3'),
    (4, 'BCAAs'),
    (5, 'Beta-alanine'),
    (6, 'Glutamine'),
    (7, 'Zinc'),
    (8, 'Magnesium');

CREATE TABLE Muscles (
    ExerciseID int,
    Muscle_name varchar(100),
    PRIMARY KEY (ExerciseID, Muscle_name),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

INSERT INTO Muscles (ExerciseID, Muscle_name) VALUES
(1, 'Quadriceps'),
(1, 'Hamstrings'),
(1, 'Glutes'),
(2, 'Pectorals'),
(2, 'Triceps'),
(2, 'Deltoids'),
(3, 'Latissimus Dorsi'),
(3, 'Biceps'),
(3, 'Trapezius'),
(4, 'Abdominals'),
(4, 'Obliques');


CREATE TABLE Equipment (
    ExerciseID int,
    Equipment_name varchar(100),
    PRIMARY KEY (ExerciseID, Equipment_name),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

INSERT INTO Equipment (ExerciseID, Equipment_name) VALUES
(1, 'Barbell'),
(1, 'Weight Plates'),
(1, 'Bench'),
(2, 'Dumbbells'),
(2, 'Incline Bench'),
(2, 'Cables'),
(3, 'Pull-Up Bar'),
(3, 'Dip Bars'),
(3, 'Resistance Bands'),
(4, 'Medicine Ball'),
(4, 'Ab Roller');

CREATE TABLE Limitations (
    ExerciseID int,
    Limitation_name varchar(100),
    PRIMARY KEY (ExerciseID, Limitation_name),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

INSERT INTO Limitations (ExerciseID, Limitation_name) VALUES
(1, 'Knee Pain'),
(1, 'Back Pain'),
(1, 'Limited Range of Motion'),
(2, 'Shoulder Injury'),
(2, 'Wrist Pain'),
(2, 'Elbow Tendinitis'),
(3, 'Limited Shoulder Mobility'),
(3, 'Rotator Cuff Injury'),
(3, 'Bicep Tendinitis'),
(4, 'Neck Pain'),
(4, 'Lower Back Pain'),
(4, 'Obesity');

-- ---------------------------------------------------------------------------
SET @@SQL_SAFE_UPDATES=0;

DELIMITER //
CREATE PROCEDURE Insert_FitnessPlan(
    IN fitness_plan VARCHAR(100),
    IN goal VARCHAR(100)
)
BEGIN
	INSERT INTO FitnessPlan (Name, Goal) VALUES
    (fitness_plan, goal);
END //
DELIMITER ;

-- (2)
DELIMITER //
CREATE PROCEDURE Insert_User_Fitness_Plan(
    IN UserID INT,
    IN FitnessPlanID INT
)
BEGIN
    UPDATE User_FitnessPlan
    SET Status = 'Not Active'
    WHERE UserID = UserID;
    
    INSERT INTO User_FitnessPlan (UserID, FitnessPlanID, Status)
    VALUES (UserID, FitnessPlanID, 'Active');
END //
DELIMITER ;

-- (3)
DELIMITER //
CREATE PROCEDURE Recommend_Exercise(
    IN muscle VARCHAR(100)
)
BEGIN
    SELECT WorkoutRoutine.Name AS 'Workout Routine Name'
	FROM WorkoutRoutine 
	INNER JOIN WorkoutRoutine_Exercise ON WorkoutRoutine.RoutineID = WorkoutRoutine_Exercise.WorkoutRoutineID 
    INNER JOIN Muscles ON Muscles.ExerciseID = WorkoutRoutine_Exercise.ExerciseID
    WHERE Muscles.Muscle_name IN (muscle);
END //
DELIMITER ;

-- (4)
DELIMITER //
CREATE PROCEDURE Insert_Record(
    IN Date date,
    IN Height INT,
    IN Weight INT,
    IN Muscle_mass INT,
    IN Body_fat INT,
    IN user_id INT
)
BEGIN
    INSERT INTO Record (Date, Height, Weight,Muscle_mass, Body_fat, UserID, MealID)
    VALUES (Date, Height, Weight,Muscle_mass, Body_fat, user_id,
    (SELECT MealID FROM DietPlan
    INNER JOIN FitnessPlan ON FitnessPlan.DietPlanID = DietPlan.DietID
    INNER JOIN User_FitnessPlan ON User_FitnessPlan.FitnessPlanID = FitnessPlan.PlanID
    WHERE User_FitnessPlan.UserID = user_id AND User_FitnessPlan.Status = 'Active'));

END //
DELIMITER ;

-- (5)
DELIMITER //
CREATE PROCEDURE Recommend_Meals(
    IN user_id INT
)
BEGIN
	SELECT Meal.Name FROM Meal
	INNER JOIN DietPlan ON DietPlan.MealID = Meal.MealID
    INNER JOIN FitnessPlan ON FitnessPlan.DietPlanID = DietPlan.DietID
    INNER JOIN User_FitnessPlan ON User_FitnessPlan.FitnessPlanID = FitnessPlan.PlanID
    WHERE User_FitnessPlan.UserID = user_id AND User_FitnessPlan.Status = 'Active';
END //
DELIMITER ;

-- (6)
DELIMITER //
CREATE PROCEDURE Select_calories(
    IN user_id INT
)
BEGIN
    SELECT Record.Date, Meal.Calories FROM Record 
	INNER JOIN Meal ON Record.MealID = Meal.MealID
	WHERE Record.UserID = user_id;
END //
DELIMITER ;

-- (7)
DELIMITER //
CREATE PROCEDURE Select_exercises(
    IN goal VARCHAR(100)
)
BEGIN
    SELECT Exercise.Name FROM Exercise 
	INNER JOIN WorkoutRoutine_Exercise ON WorkoutRoutine_Exercise.ExerciseID = Exercise.ExerciseID
    INNER JOIN FitnessPlan_WorkoutRoutine ON FitnessPlan_WorkoutRoutine.WorkoutRoutineID = WorkoutRoutine_Exercise.WorkoutRoutineID
    INNER JOIN FitnessPlan ON FitnessPlan.PlanID = FitnessPlan_WorkoutRoutine.FitnessPlanID
    WHERE FitnessPlan.goal = goal;
END //
DELIMITER ;

-- (8)
DELIMITER //
CREATE PROCEDURE Insert_WorkoutRoutine(
    IN name VARCHAR(100),
    IN calories_burnt INT,
    IN user_id INT
)
BEGIN
    INSERT INTO WorkoutRoutine (Name, Calories_burnt) 
    VALUES (name, calories_burnt);
    
    INSERT INTO FitnessPlan_WorkoutRoutine (FitnessPlanID, WorkoutRoutineID)
    VALUES ((SELECT FitnessPlanID FROM User_FitnessPlan WHERE UserID = user_id AND Status = "Active"), (SELECT MAX(RoutineID) FROM WorkoutRoutine));
END //
DELIMITER ;

-- (9)
DELIMITER //
CREATE PROCEDURE Recommend_Supplements(
    IN user_id INT
)
BEGIN
    SELECT Supplements.Supplement_name FROM Supplements 
    INNER JOIN Meal ON Meal.MealID = Supplements.MealID
    INNER JOIN DietPlan ON DietPlan.MealID = Meal.MealID
    INNER JOIN FitnessPlan ON FitnessPlan.DietPlanID = DietPlan.DietID
    INNER JOIN User_FitnessPlan ON User_FitnessPlan.FitnessPlanID = FitnessPlan.PlanID
    WHERE User_FitnessPlan.UserID = user_id AND User_FitnessPlan.Status = "Active";
END //
DELIMITER ;

-- (11)
DELIMITER //
CREATE PROCEDURE Exercises_ButLimitations(
    IN limitations VARCHAR(100)
)
BEGIN
    SELECT Exercise.Name FROM Exercise
    INNER JOIN Limitations ON Limitations.ExerciseID = Exercise.ExerciseID
    WHERE Limitations.Limitation_Name = limitations;
END //
DELIMITER ;

-- (12)
DELIMITER //
CREATE PROCEDURE View_Records(
    IN user_id INT
)
BEGIN
    SELECT User.Name, Record.Height AS 'Height (m)', 
    Record.Weight AS 'Weight (kg)', Record.Muscle_mass AS 'Muscle Mass (kg)', 
    Record.Body_fat AS "Body Fat (%)" FROM Record
    INNER JOIN User ON Record.UserID = User.UserID
    WHERE Record.UserID = user_id;
END //
DELIMITER ;



-- SQL Queries ---------------------------------------------------------------------

-- (1) Can you help me create a new fitness plan that aligns with my goals?
CALL Insert_FitnessPlan("New Fitness Plan", "My Goal");
    
-- (2) I want to change my current fitness plan. How can I do that in the system?
DELIMITER //
BEGIN TRY 
     CALL Insert_User_Fitness_Plan(1, 4);
END TRY  
BEGIN CATCH  
    UPDATE User_FitnessPlan SET status = 'Active' WHERE UserID = 1 AND FitnessPlanID = 4;
END CATCH  
DELIMITER ;


-- (3) Can you suggest a workout routine that targets specific muscle groups?
CALL Recommend_Exercise('biceps');
    
-- (4) I want to track my progress towards my fitness goals. Is there a way to do that in the system?
 CALL Insert_Record('2023-04-11','170','65','30','15','1');
 
 -- (5) Can you recommend some healthy meals that align with my dietary preferences?
CALL Recommend_Meals('1');
    
-- (6) I want to track my calorie intake. Is there a feature in the system for that?
CALL Select_calories('1');

-- (7) Can you suggest exercises that are suitable for my fitness level?
CALL Select_exercises('Build endurance');

-- (8) I want to add a new workout routine to my fitness plan. How can I do that in the system?
CALL Insert_WorkoutRoutine('New Workout Routine', '200', '1');

-- (9) Can you recommend supplements that will help me achieve my fitness goals?
CALL Recommend_Supplements('1');

-- (10) I want to track my body measurements, such as my weight and body fat percentage. Is there a way to do that in the system?
-- Same as Part (4)

-- (11) Can you suggest exercises that are suitable for my current injuries or limitations?
CALL Exercises_ButLimitations('Knee Pain');

-- (12) I want to view a report of my progress over time. How can I do that in the system?
CALL View_Records('1');