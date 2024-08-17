create database onlinequizsys;

use onlinequizsys;

drop database onlinequizsys;

-- create table - 
-- Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(100),
    RegistrationDate DATE
);
-- Shows table structure
desc users;

-- Quizzes
CREATE TABLE Quizzes (
    QuizID INT PRIMARY KEY,
    QuizName VARCHAR(100),
    Description TEXT,
    UserID INT,
    CreationDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- Shows table structure
desc quizzes;

-- Questions
CREATE TABLE Questions (
    QuestionID INT PRIMARY KEY,
    QuizID INT,
    QuestionText TEXT,
    QuestionType VARCHAR(50),
    FOREIGN KEY (QuizID) REFERENCES Quizzes(QuizID)
);
-- Shows table structure
desc questions;

-- Options
CREATE TABLE Options (
    OptionID INT PRIMARY KEY,
    QuestionID INT,
    OptionText VARCHAR(255),
    IsCorrect BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID)
);
-- Shows table structure
desc options;

-- UserAnswers
CREATE TABLE UserAnswers (
    UserAnswerID INT PRIMARY KEY,
    UserID INT,
    QuestionID INT,
    SelectedOptionID INT,
    AnswerDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID),
    FOREIGN KEY (SelectedOptionID) REFERENCES Options(OptionID)
);
-- Shows table structure
desc useranswers;

-- scores
CREATE TABLE Scores (
    ScoreID INT PRIMARY KEY,
    UserID INT,
    QuizID INT,
    Score DECIMAL(5,2),
    AttemptDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (QuizID) REFERENCES Quizzes(QuizID)
);
-- Shows table structure
desc scores;

-- insert records 
-- Users
---------------------------------- Insert into Users
INSERT INTO Users (UserID, Username, Email, Password, RegistrationDate) VALUES
(1, 'Alice', 'alice@example.com', 'password1', '2024-01-01'),
(2, 'Bob', 'bob@example.com', 'password2', '2024-01-02'),
(3, 'Charlie', 'charlie@example.com', 'password3', '2024-01-03'),
(4, 'David', 'david@example.com', 'password4', '2024-01-04'),
(5, 'Eve', 'eve@example.com', 'password5', '2024-01-05'),
(6, 'Frank', 'frank@example.com', 'password6', '2024-01-06'),
(7, 'Grace', 'grace@example.com', 'password7', '2024-01-07'),
(8, 'Hank', 'hank@example.com', 'password8', '2024-01-08'),
(9, 'Ivy', 'ivy@example.com', 'password9', '2024-01-09'),
(10, 'Jack', 'jack@example.com', 'password10', '2024-01-10');


-- check inserted data
select * from users;

-- quizzes
--------------------------------------------- Insert into Quizzes
INSERT INTO Quizzes (QuizID, QuizName, Description, UserID, CreationDate) VALUES
(1, 'General Knowledge Quiz', 'A quiz to test your general knowledge.', 1, '2024-01-11'),
(2, 'Science Quiz', 'A quiz to test your science knowledge.', 2, '2024-01-12'),
(3, 'History Quiz', 'A quiz to test your history knowledge.', 3, '2024-01-13'),
(4, 'Math Quiz', 'A quiz to test your math knowledge.', 4, '2024-01-14'),
(5, 'Literature Quiz', 'A quiz to test your literature knowledge.', 5, '2024-01-15'),
(6, 'Geography Quiz', 'A quiz to test your geography knowledge.', 6, '2024-01-16'),
(7, 'Music Quiz', 'A quiz to test your music knowledge.', 7, '2024-01-17'),
(8, 'Art Quiz', 'A quiz to test your art knowledge.', 8, '2024-01-18'),
(9, 'Sports Quiz', 'A quiz to test your sports knowledge.', 9, '2024-01-19'),
(10, 'Technology Quiz', 'A quiz to test your technology knowledge.', 10, '2024-01-20');


-- check inserted data
select * from quizzes;

-- Questions
------------------------------------------------------------- Insert into Questions
INSERT INTO Questions (QuestionID, QuizID, QuestionText, QuestionType) VALUES
(1, 1, 'What is the capital of France?', 'Multiple Choice'),
(2, 1, 'Which planet is known as the Red Planet?', 'Multiple Choice'),
(3, 1, 'Who wrote "To Kill a Mockingbird"?', 'Multiple Choice'),
(4, 1, 'What is the smallest prime number?', 'Multiple Choice'),
(5, 2, 'What is H2O?', 'Multiple Choice'),
(6, 2, 'What is the speed of light?', 'Multiple Choice'),
(7, 2, 'Who developed the theory of relativity?', 'Multiple Choice'),
(8, 2, 'What is the chemical symbol for gold?', 'Multiple Choice'),
(9, 3, 'Who was the first president of the United States?', 'Multiple Choice'),
(10, 3, 'In what year did World War II end?', 'Multiple Choice'),
(11, 3, 'What ancient civilization built the pyramids?', 'Multiple Choice'),
(12, 3, 'Who was the first emperor of China?', 'Multiple Choice'),
(13, 4, 'What is the value of Pi?', 'Multiple Choice'),
(14, 4, 'What is 2 + 2?', 'Multiple Choice'),
(15, 4, 'What is the square root of 16?', 'Multiple Choice'),
(16, 4, 'What is the derivative of x^2?', 'Multiple Choice'),
(17, 5, 'Who wrote "Hamlet"?', 'Multiple Choice'),
(18, 5, 'Who wrote "Pride and Prejudice"?', 'Multiple Choice'),
(19, 5, 'Who wrote "1984"?', 'Multiple Choice'),
(20, 5, 'Who wrote "The Great Gatsby"?', 'Multiple Choice'),
(21, 6, 'What is the capital of Canada?', 'Multiple Choice'),
(22, 6, 'Which country is known as the Land of the Rising Sun?', 'Multiple Choice'),
(23, 6, 'What is the largest ocean?', 'Multiple Choice'),
(24, 6, 'Which continent is known as the Dark Continent?', 'Multiple Choice'),
(25, 7, 'Who is known as the King of Pop?', 'Multiple Choice'),
(26, 7, 'What instrument does Yo-Yo Ma play?', 'Multiple Choice'),
(27, 7, 'Who composed the Four Seasons?', 'Multiple Choice'),
(28, 7, 'Who is the lead singer of U2?', 'Multiple Choice'),
(29, 8, 'Who painted the Mona Lisa?', 'Multiple Choice'),
(30, 8, 'Who sculpted David?', 'Multiple Choice'),
(31, 8, 'Who painted the Sistine Chapel?', 'Multiple Choice'),
(32, 8, 'Who painted Starry Night?', 'Multiple Choice'),
(33, 9, 'Who won the FIFA World Cup in 2018?', 'Multiple Choice'),
(34, 9, 'Who has the most Olympic gold medals?', 'Multiple Choice'),
(35, 9, 'Who is known as the Lightning Bolt?', 'Multiple Choice'),
(36, 9, 'Who is the only athlete to play in both the World Series and the Super Bowl?', 'Multiple Choice'),
(37, 10, 'Who founded Microsoft?', 'Multiple Choice'),
(38, 10, 'What is the capital of Silicon Valley?', 'Multiple Choice'),
(39, 10, 'Who is the CEO of Tesla?', 'Multiple Choice'),
(40, 10, 'What does HTML stand for?', 'Multiple Choice');

-- check inserted data
select * from questions;

-- Options
------------------------------------------------------------- Insert into Options
INSERT INTO Options (OptionID, QuestionID, OptionText, IsCorrect) VALUES
(1, 1, 'Paris', TRUE),
(2, 1, 'London', FALSE),
(3, 1, 'Berlin', FALSE),
(4, 1, 'Rome', FALSE),
(5, 2, 'Earth', FALSE),
(6, 2, 'Mars', TRUE),
(7, 2, 'Jupiter', FALSE),
(8, 2, 'Venus', FALSE),
(9, 3, 'Harper Lee', TRUE),
(10, 3, 'J.K. Rowling', FALSE),
(11, 3, 'Ernest Hemingway', FALSE),
(12, 3, 'Jane Austen', FALSE),
(13, 4, '1', FALSE),
(14, 4, '2', TRUE),
(15, 4, '3', FALSE),
(16, 4, '4', FALSE),
(17, 5, 'Water', TRUE),
(18, 5, 'Oxygen', FALSE),
(19, 5, 'Carbon Dioxide', FALSE),
(20, 5, 'Helium', FALSE),
(21, 6, '299,792 km/s', TRUE),
(22, 6, '150,000 km/s', FALSE),
(23, 6, '300,000 km/s', FALSE),
(24, 6, '280,000 km/s', FALSE),
(25, 7, 'Albert Einstein', TRUE),
(26, 7, 'Isaac Newton', FALSE),
(27, 7, 'Galileo Galilei', FALSE),
(28, 7, 'Nikola Tesla', FALSE),
(29, 8, 'Au', TRUE),
(30, 8, 'Ag', FALSE),
(31, 8, 'Pb', FALSE),
(32, 8, 'Fe', FALSE),
(33, 9, 'George Washington', TRUE),
(34, 9, 'Abraham Lincoln', FALSE),
(35, 9, 'Thomas Jefferson', FALSE),
(36, 9, 'John Adams', FALSE),
(37, 10, '1945', TRUE),
(38, 10, '1918', FALSE),
(39, 10, '1939', FALSE),
(40, 10, '1950', FALSE),
(41, 11, 'Egyptians', TRUE),
(42, 11, 'Romans', FALSE),
(43, 11, 'Greeks', FALSE),
(44, 11, 'Mayans', FALSE),
(45, 12, 'Qin Shi Huang', TRUE),
(46, 12, 'Genghis Khan', FALSE),
(47, 12, 'Kublai Khan', FALSE),
(48, 12, 'Sun Tzu', FALSE),
(49, 13, '3.14', TRUE),
(50, 13, '2.71', FALSE),
(51, 13, '1.62', FALSE),
(52, 13, '1.41', FALSE),
(53, 14, '3', FALSE),
(54, 14, '4', TRUE),
(55, 14, '5', FALSE),
(56, 14, '6', FALSE),
(57, 15, '2', FALSE),
(58, 15, '4', TRUE),
(59, 15, '6', FALSE),
(60, 15, '8', FALSE),
(61, 16, '2x', TRUE),
(62, 16, 'x', FALSE),
(63, 16, '2', FALSE),
(64, 16, '1', FALSE),
(65, 17, 'Shakespeare', TRUE),
(66, 17, 'Dickens', FALSE),
(67, 17, 'Austen', FALSE),
(68, 17, 'Orwell', FALSE),
(69, 18, 'Austen', TRUE),
(70, 18, 'Bronte', FALSE),
(71, 18, 'Shelley', FALSE),
(72, 18, 'Woolf', FALSE),
(73, 19, 'Orwell', TRUE),
(74, 19, 'Huxley', FALSE),
(75, 19, 'Bradbury', FALSE),
(76, 19, 'Asimov', FALSE),
(77, 20, 'Fitzgerald', TRUE),
(78, 20, 'Hemingway', FALSE),
(79, 20, 'Salinger', FALSE),
(80, 20, 'Steinbeck', FALSE),
(81, 21, 'Ottawa', TRUE),
(82, 21, 'Toronto', FALSE),
(83, 21, 'Vancouver', FALSE),
(84, 21, 'Montreal', FALSE),
(85, 22, 'Japan', TRUE),
(86, 22, 'China', FALSE),
(87, 22, 'India', FALSE),
(88, 22, 'South Korea', FALSE),
(89, 23, 'Pacific', TRUE),
(90, 23, 'Atlantic', FALSE),
(91, 23, 'Indian', FALSE),
(92, 23, 'Arctic', FALSE),
(93, 24, 'Africa', TRUE),
(94, 24, 'Asia', FALSE),
(95, 24, 'Europe', FALSE),
(96, 24, 'Australia', FALSE),
(97, 25, 'Michael Jackson', TRUE),
(98, 25, 'Elvis Presley', FALSE),
(99, 25, 'Prince', FALSE),
(100, 25, 'Freddie Mercury', FALSE),
(101, 26, 'Cello', TRUE),
(102, 26, 'Violin', FALSE),
(103, 26, 'Piano', FALSE),
(104, 26, 'Guitar', FALSE),
(105, 27, 'Vivaldi', TRUE),
(106, 27, 'Bach', FALSE),
(107, 27, 'Mozart', FALSE),
(108, 27, 'Beethoven', FALSE),
(109, 28, 'Bono', TRUE),
(110, 28, 'Sting', FALSE),
(111, 28, 'Bowie', FALSE),
(112, 28, 'Mick Jagger', FALSE),
(113, 29, 'Da Vinci', TRUE),
(114, 29, 'Michelangelo', FALSE),
(115, 29, 'Raphael', FALSE),
(116, 29, 'Donatello', FALSE),
(117, 30, 'Michelangelo', TRUE),
(118, 30, 'Da Vinci', FALSE),
(119, 30, 'Raphael', FALSE),
(120, 30, 'Donatello', FALSE),
(121, 31, 'Michelangelo', TRUE),
(122, 31, 'Da Vinci', FALSE),
(123, 31, 'Raphael', FALSE),
(124, 31, 'Donatello', FALSE),
(125, 32, 'Van Gogh', TRUE),
(126, 32, 'Picasso', FALSE),
(127, 32, 'Monet', FALSE),
(128, 32, 'Matisse', FALSE),
(129, 33, 'France', TRUE),
(130, 33, 'Germany', FALSE),
(131, 33, 'Brazil', FALSE),
(132, 33, 'Argentina', FALSE),
(133, 34, 'Phelps', TRUE),
(134, 34, 'Bolt', FALSE),
(135, 34, 'Lewis', FALSE),
(136, 34, 'Spitz', FALSE),
(137, 35, 'Bolt', TRUE),
(138, 35, 'Phelps', FALSE),
(139, 35, 'Lewis', FALSE),
(140, 35, 'Spitz', FALSE),
(141, 36, 'Jackson', TRUE),
(142, 36, 'Sanders', FALSE),
(143, 36, 'Thorpe', FALSE),
(144, 36, 'Jordan', FALSE),
(145, 37, 'Gates', TRUE),
(146, 37, 'Jobs', FALSE),
(147, 37, 'Musk', FALSE),
(148, 37, 'Bezos', FALSE),
(149, 38, 'San Jose', TRUE),
(150, 38, 'Palo Alto', FALSE),
(151, 38, 'Mountain View', FALSE),
(152, 38, 'Cupertino', FALSE),
(153, 39, 'Musk', TRUE),
(154, 39, 'Zuckerberg', FALSE),
(155, 39, 'Page', FALSE),
(156, 39, 'Bezos', FALSE),
(157, 40, 'HyperText Markup Language', TRUE),
(158, 40, 'HyperText Machine Language', FALSE),
(159, 40, 'HyperTransfer Markup Language', FALSE),
(160, 40, 'HyperText Mockup Language', FALSE);

-- check inserted data
select * from options;

-- UserAnswers
----------------------------------------------------------- Insert into UserAnswers
INSERT INTO UserAnswers (UserAnswerID, UserID, QuestionID, SelectedOptionID, AnswerDate) VALUES
(1, 1, 1, 1, '2024-01-21'),
(2, 1, 2, 6, '2024-01-21'),
(3, 1, 3, 9, '2024-01-21'),
(4, 1, 4, 14, '2024-01-21'),
(5, 2, 5, 17, '2024-01-22'),
(6, 2, 6, 21, '2024-01-22'),
(7, 2, 7, 25, '2024-01-22'),
(8, 2, 8, 29, '2024-01-22'),
(9, 3, 9, 33, '2024-01-23'),
(10, 3, 10, 37, '2024-01-23'),
(11, 4, 11, 41, '2024-01-24'),
(12, 4, 12, 45, '2024-01-24'),
(13, 4, 13, 49, '2024-01-24'),
(14, 4, 14, 54, '2024-01-24'),
(15, 5, 15, 58, '2024-01-25'),
(16, 5, 16, 61, '2024-01-25'),
(17, 5, 17, 65, '2024-01-25'),
(18, 5, 18, 69, '2024-01-25'),
(19, 6, 19, 73, '2024-01-26'),
(20, 6, 20, 77, '2024-01-26'),
(21, 6, 21, 81, '2024-01-26'),
(22, 6, 22, 85, '2024-01-26'),
(23, 7, 23, 89, '2024-01-27'),
(24, 7, 24, 93, '2024-01-27'),
(25, 7, 25, 97, '2024-01-27'),
(26, 7, 26, 101, '2024-01-27'),
(27, 8, 27, 105, '2024-01-28'),
(28, 8, 28, 109, '2024-01-28'),
(29, 8, 29, 113, '2024-01-28'),
(30, 8, 30, 117, '2024-01-28'),
(31, 9, 31, 121, '2024-01-29'),
(32, 9, 32, 125, '2024-01-29'),
(33, 9, 33, 129, '2024-01-29'),
(34, 9, 34, 133, '2024-01-29'),
(35, 10, 35, 137, '2024-01-30'),
(36, 10, 36, 141, '2024-01-30'),
(37, 10, 37, 145, '2024-01-30'),
(38, 10, 38, 149, '2024-01-30'),
(39, 10, 39, 153, '2024-01-30'),
(40, 10, 40, 157, '2024-01-30');

-- check inserted data
select * from useranswers;

-- scores
--------------------------------------------------------- Insert into Scores
INSERT INTO Scores (ScoreID, UserID, QuizID, Score, AttemptDate) VALUES
(1, 1, 1, 4, '2024-01-21'),
(2, 2, 2, 4, '2024-01-22'),
(3, 3, 3, 2, '2024-01-23'),
(4, 4, 4, 3, '2024-01-24'),
(5, 5, 5, 3, '2024-01-25'),
(6, 6, 6, 4, '2024-01-26'),
(7, 7, 7, 4, '2024-01-27'),
(8, 8, 8, 4, '2024-01-28'),
(9, 9, 9, 4, '2024-01-29'),
(10, 10, 10, 5, '2024-01-30');

-- check inserted data
select * from scores;

-- 3. Select Records: Quizzes created after January 1, 2024
SELECT * FROM Quizzes WHERE CreationDate > '2024-01-01';

-- 4. Where Clause (AND/OR): Questions where QuestionType is 'Multiple Choice' and QuizID is 3
SELECT * FROM Questions WHERE QuestionType = 'Multiple Choice' AND QuizID = 3;

SELECT * FROM Questions WHERE QuestionType = 'Multiple Choice' OR QuizID = 3;

-- 5. LIKE Operator: Quizzes where QuizName contains 'General'
SELECT * FROM Quizzes WHERE QuizName LIKE '%General%';

-- 6. CASE Statement: OptionText and OptionStatus
SELECT OptionText,
       CASE 
           WHEN IsCorrect = TRUE THEN 'Correct'
           ELSE 'Incorrect'
       END AS OptionStatus
FROM Options;

-- 7. Subquery: Users who have answered more than 20 questions
SELECT UserID
FROM UserAnswers
GROUP BY UserID
HAVING COUNT(QuestionID) > 5;

-- 8. Group By: Total number of questions for each quiz
SELECT QuizID, COUNT(QuestionID) AS TotalQuestions
FROM Questions
GROUP BY QuizID;

-- 9. Having Clause: Total number of quizzes created by each user, 
-- only including users who have created more than 3 quizzes
SELECT u.UserID, u.Username, COUNT(q.QuizID) AS TotalQuizzes
FROM Users u
JOIN Quizzes q ON u.UserID = q.UserID
GROUP BY u.UserID, u.Username
HAVING COUNT(q.QuizID) > 3;


-- 10. Limit:Top 5 quizzes with the highest number of questions
SELECT QuizID, COUNT(QuestionID) AS TotalQuestions
FROM Questions
GROUP BY QuizID
ORDER BY TotalQuestions DESC
LIMIT 5;

-- 11. Inner Join: User answers including Username, QuestionText, and SelectedOptionID
SELECT ua.UserID, q.QuestionText, ua.SelectedOptionID, u.Username
FROM UserAnswers ua
INNER JOIN Questions q ON ua.QuestionID = q.QuestionID
INNER JOIN Users u ON ua.UserID = u.UserID;

-- 12. Outer Join: All quizzes and any associated questions
SELECT q.QuizID, q.QuizName, COUNT(qs.QuestionID) AS NumberOfQuestions
FROM Quizzes q
LEFT JOIN Questions qs ON q.QuizID = qs.QuizID
GROUP BY q.QuizID, q.QuizName;

-- 13. Join with Aggregation: Total number of options for each question
SELECT q.QuestionID, COUNT(o.OptionID) AS TotalOptions
FROM Questions q
INNER JOIN Options o ON q.QuestionID = o.QuestionID
GROUP BY q.QuestionID;

-- 14. Subquery with Join: Quizzes where the average score for all users is higher than 80
SELECT q.QuizID, q.QuizName
FROM Quizzes q
WHERE (SELECT AVG(s.Score) FROM Scores s WHERE s.QuizID = q.QuizID) > 80;

-- 15. Advanced Join: List Username, QuizName, and Score for all users who have completed a quiz
SELECT u.Username, q.QuizName, s.Score
FROM Users u
INNER JOIN Scores s ON u.UserID = s.UserID
LEFT JOIN Quizzes q ON s.QuizID = q.QuizID;



