#1

CREATE DATABASE IF NOT EXISTS ProjectManagement;

USE ProjectManagement;

#2 and 3

CREATE TABLE IF NOT EXISTS Employee
( ENr INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  EName VARCHAR(256) NOT NULL );
  
INSERT INTO Employee (ENr, EName) VALUES
(123, "Albert"),(234, "Barbara"),(345, "Charlotte") ,(456, "Daniel"); 

CREATE TABLE IF NOT EXISTS Project
( Project VARCHAR (255) NOT NULL PRIMARY KEY,
  Title VARCHAR (255) NOT NULL,
  Customer VARCHAR (255) NOT NULL );
  
INSERT INTO Project (Project, Title, Customer) VALUES
("DM", "Data Management", "IBM") ,("CC", "Cloud Computing","IBM") ,("BDT", "Big Data", "Microsoft") ,("IOT", "Internet of Things", "Microsoft"),("VA", "Visual Analytics","SAP");

CREATE TABLE IF NOT EXISTS Collaboration
( ENr INTEGER NOT NULL REFERENCES Employee (ENR),
  Project VARCHAR (255) NOT NULL REFERENCES Project (Project),
  Hours INTEGER NOT NULL,
  PRIMARY KEY (ENr, Project) );
  
INSERT INTO Collaboration (ENr, Project,Hours) VALUES
(123, "DM", 17),(123, "CC", 23),(123, "VA", 5),(234, "BDT", 28),(234, "VA", 12),(345, "DM", 21),(345, "IOT", 9),(456, "VA", 15);

#4

SELECT Employee.EName
FROM Employee , Collaboration  
WHERE Employee.ENr = Collaboration.ENr AND Collaboration.Project = 'DM';

#Result: 
#  EName
# 'Albert'
# 'Charlotte'

#5 

SELECT Project.Title, Collaboration.Hours
FROM Project, Collaboration, Employee
WHERE Project.Project = Collaboration.Project AND Employee.Enr = Collaboration.ENr AND Employee.EName = 'Albert';

#Result:
# Title, Hours 
#'Cloud Computing','23'
#'Data Management','17'
#'Visual Analytics','5'

#6 

UPDATE Collaboration SET Hours = 20 
WHERE Project ='VA'AND Collaboration.ENr = (SELECT Employee.ENr FROM Employee WHERE Employee.EName = 'Daniel');

#7

SELECT Project.Title, SUM(Collaboration.Hours)
FROM Project, Collaboration 
WHERE Project.Project = Collaboration.Project
GROUP BY Project.Title;

#Result:
# Title, SUM(Collaboration.Hours)
#'Cloud Computing','23'
#'Data Management','38'
#'Visual Analytics','37'
#'Big Data','28'
#'Internet of Things','9'

#8

INSERT INTO Collaboration (ENr, Project, Hours) VALUES
(456, 'IOT', 10);

#9 

SELECT COUNT(Collaboration.ENr)
FROM Collaboration 
WHERE Collaboration.Project = 'VA';

#Result: 
# COUNT(Collaboration.ENr) = 3

#10 

DELETE FROM Collaboration WHERE Project = 'IOT' AND ENr = (SELECT Employee.ENr FROM Employee WHERE Employee.EName = 'Charlotte');

#11 

SELECT Project.Customer 
FROM Project 
GROUP BY Project.Customer
HAVING COUNT(Project.Project) >= 2;

#Result:
#  Customer 
# 'Microsoft' 
# 'IBM'

#12 

SELECT AVG(Collaboration.Hours) avg_hours
FROM Collaboration , Project 
WHERE Collaboration.Project = Project.Project AND Project.Customer = 'Microsoft'
GROUP BY Project.Customer;

#Result:
# avg_hours  
# 19.000

# 13 

SELECT Employee.EName 
FROM Employee, Collaboration  
WHERE Employee.ENr = Collaboration.ENr AND Collaboration.Project = 'VA' AND Collaboration.Hours >= (SELECT Collaboration.Hours FROM Employee, Collaboration WHERE Employee.ENr = Collaboration.ENr AND Collaboration.Project = 'VA' AND Employee.EName = 'Albert') AND Employee.EName <> 'Albert';

#Result
# EName 
#'Barbara' 
#'Daniel'

#14 

SELECT DISTINCT (Employee.EName) 
FROM Employee, Collaboration, Project
WHERE Employee.ENr = Collaboration.ENr AND Collaboration.Project = Project.Project AND Project.Customer = 'Microsoft';

#Result: 
# EName
#'Barbara'
#'Daniel'

#15 

SELECT Project.Title, AVG(Collaboration.Hours) average_hours
FROM Project, Collaboration 
WHERE Project.Project = Collaboration.Project
GROUP BY Project.Title;

#Result:
# Title, average_hours
# 'Cloud Computing','23.0000'
#'Data Management','19.0000'
#'Visual Analytics','12.3333'
#'Big Data','28.0000'
#'Internet of Things','10.0000

# 16 

SELECT Project.Customer, COUNT(DISTINCT(Employee.ENr)) count_Employee
FROM Employee, Project, Collaboration 
WHERE Employee.ENr = Collaboration.ENr and Collaboration.Project = Project.Project
GROUP BY Project.Customer;

#Result:
# Customer, count_Employee
#'IBM','2'
#'Microsoft','2'
#'SAP','3'

# 17 

SELECT Employee.EName, AVG(Collaboration.Hours) average_hours
FROM Employee, Collaboration 
WHERE Employee.ENr = Collaboration.ENr
GROUP BY Employee.EName 
HAVING AVG(Collaboration.Hours) > 20;

#Result:
# EName, average_hours
#'Charlotte', 21.0000

#18

SELECT Project.Title, MIN(Collaboration.Hours) lowest_hours
FROM Project, Collaboration
WHERE Project.Project = Collaboration.pROJECT
GROUP BY Project.Title;

#Result:
# Title, lowest_hours
# 'Cloud Computing', 23
# 'Data Management', 17
# 'Visual Analytics', 5
# 'Big Data', 28
# 'Internet of Things', 10




