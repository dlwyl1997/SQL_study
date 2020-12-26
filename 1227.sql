# task 1
CREATE TABLE employee (id INT(11) NOT NULL,
					   name VARCHAR(50) NOT NULL,
					   salary DECIMAL(10,2) NOT NULL DEFAULT '0.00',
					   departmentid INT(11) NOT NULL,
					   PRIMARY KEY (id));

INSERT INTO employee VALUES ('1', 'Joe', '70000.00', '1');
INSERT INTO employee VALUES ('2', 'Herry', '80000.00', '2');
INSERT INTO employee VALUES ('3', 'Sam', '60000.00', '2');
INSERT INTO employee VALUES ('4', 'Max', '90000.00', '1');
INSERT INTO employee VALUES ('5', 'Janet', '69000.00', '1');
INSERT INTO employee VALUES ('6', 'Randy', '85000.00', '1');
INSERT INTO employee VALUES ('7', 'sherry', '90000.00', '1');
INSERT INTO employee VALUES ('8', 'haha', '80000.00', '2');
INSERT INTO employee VALUES ('9', 'Abbo', '80800.00', '3');

CREATE TABLE department (id INT(11) NOT NULL,
						 name VARCHAR(100) NOT NULL,
						 PRIMARY KEY (id));

INSERT INTO department VALUES ('1', 'IT');
INSERT INTO department VALUES ('2', 'Sales');
INSERT INTO department VALUES ('3', 'customs');

SELECT e.*, t.name department, t.maxsal
  FROM employee e
 INNER JOIN (SELECT e.departmentid,d.name,MAX(salary) maxsal
               FROM employee e
              INNER JOIN department d
                 on e.departmentid = d.id
			  GROUP BY e.departmentid,d.name) t
				 on e.departmentid = t.departmentid
WHERE e.salary=t.maxsal;


# task 2
CREATE TABLE seat (id INT(11) NOT NULL,
				   student VARCHAR(20) NOT NULL,
				   PRIMARY KEY (id));

INSERT INTO seat VALUES ('1', 'Abbot');
INSERT INTO seat VALUES ('2', 'Doris');
INSERT INTO seat VALUES ('3', 'Emerson');
INSERT INTO seat VALUES ('4', 'Green');
INSERT INTO seat VALUES ('5', 'Jeames');

SELECT id-1 as id,student
  FROM seat
 WHERE id % 2=0
 UNION
SELECT id+1 as id,student
  FROM seat
 WHERE id % 2=1 AND id < (SELECT COUNT(*) FROM seat)
 UNION
SELECT *
  FROM seat
 WHERE id % 2=1 AND id =(SELECT COUNT(*) FROM seat)
 ORDER BY id;


# task 3
Create table Scores (Id INT NOT NULL,
					 Score DECIMAL(3,2) NOT NULL);

INSERT INTO Scores (Id, Score) VALUES ('1','3.5');  
INSERT INTO Scores (Id, Score) VALUES ('2','3.65');  
INSERT INTO Scores (Id, Score) VALUES ('3','4.0');  
INSERT INTO Scores (Id, Score) VALUES ('4','3.85');  
INSERT INTO Scores (Id, Score) VALUES ('5','4.0');  
INSERT INTO Scores (Id, Score) VALUES ('6','3.65'); 

SELECT Score,
	   (SELECT COUNT(DISTINCT Score)
		  FROM Scores
		 WHERE Score>=s.Score) AS Rank
  FROM Scores AS s
 ORDER BY Score DESC;


# task 4
CREATE TABLE logs (id INT NOT NULL,
				   Num INT NOT NULL);

INSERT INTO logs VALUES (1, 1);
INSERT INTO logs VALUES (2, 1);
INSERT INTO logs VALUES (3, 1);
INSERT INTO logs VALUES (4, 2);
INSERT INTO logs VALUES (5, 1);
INSERT INTO logs VALUES (6, 2);
INSERT INTO logs VALUES (7, 2);

SELECT DISTINCT A.Num ConsecutiveNums FROM logs AS a
 INNER JOIN logs AS B ON A.id+1 = B.id AND A.Num = B.Num
 INNER JOIN logs AS C ON B.id+1 = C.id AND B.Num = C.Num;


# task 5
SELECT id, IF(ISNULL(p_id), 'Root', IF(id IN (SELECT p_id FROM tree), 'Inner', 'Leaf')) AS Type 
  FROM tree
 ORDER BY id;


# task 6
  DROP TABLE employee;
CREATE TABLE employee (Id INT PRIMARY KEY,
					   Name VARCHAR (255),
					   Department VARCHAR (255),
					   ManagerId INT);

INSERT INTO employee VALUES ('101', 'John', 'A', 'null');
INSERT INTO employee VALUES ('102', 'Dan', 'A', '101 ');
INSERT INTO employee VALUES ('103', 'James', 'A', '101');
INSERT INTO employee VALUES ('104', 'Amy', 'A', '101');
INSERT INTO employee VALUES ('105', 'Anne', 'A', '101');
INSERT INTO employee VALUES ('106', 'Ron', 'B', '101');
/*
SELECT a.Name
  FROM Employee a
  LEFT JOIN Employee b
    ON a.Id = b.ManagerId
 GROUP BY a.Id
HAVING COUNT(1) >= 5;
*/
SELECT Name
  FROM (SELECT ManagerId, COUNT(Id) AS n
		  FROM employee
		 GROUP BY ManagerId) m, employee e
 WHERE m.ManagerId = e.Id AND n >= 5;


# task 7
SELECT Score,rank() over(ORDER BY Score DESC) AS Rank
  FROM Scores;


# task 8
SELECT question_id AS survey_log
  FROM ( SELECT question_id,
			SUM(case when action = "answer" THEN 1 ELSE 0 END) as num_answers,
			SUM(case when action = "show" THEN 1 ELSE 0 END) as num_shows
		   FROM survey_log
		  GROUP BY question_id ) AS tbl
 ORDER BY (num_answers / num_shows) DESC
 LIMIT 1;


# task 9
SELECT Department.Name,t.Name,t.Salary
  FROM ( SELECT Id, 
				Name, 
                DepartmentId, 
                salary, 
                row_number() 
		   OVER ( PARTITION BY DepartmentId 
					  ORDER BY Salary DESC ) AS rank FROM employee) t
  LEFT JOIN Department
    ON t.DepartmentID = Department.id
 WHERE t.rank <= 3;
