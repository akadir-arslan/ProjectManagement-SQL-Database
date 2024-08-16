# SQL Programming for ProjectManagement Database

This project demonstrates the creation and management of a relational database using MySQL, focusing on a project management system for a company. The database contains tables for employees, projects, and their collaborations. The following queries are executed to perform various tasks, such as updating, inserting, and retrieving data:

## Tables

### `Employee` Table

| ENr | EName    |
|-----|----------|
| 123 | Albert   |
| 234 | Barbara  |
| 345 | Charlotte|
| 456 | Daniel   |

### `Collaboration` Table

| ENr | Project | Hours |
|-----|---------|-------|
| 123 | DM      | 17    |
| 123 | CC      | 23    |
| 123 | VA      | 5     |
| 234 | BDT     | 28    |
| 234 | VA      | 12    |
| 345 | DM      | 21    |
| 345 | IOT     | 9     |
| 456 | VA      | 15    |

### `Project` Table

| Project | Title               | Customer |
|---------|---------------------|----------|
| DM      | Data Management      | IBM      |
| CC      | Cloud Computing      | IBM      |
| BDT     | Big Data             | Microsoft|
| IOT     | Internet of Things   | Microsoft|
| VA      | Visual Analytics     | SAP      |

## 1. Create Database

- Create the `ProjectManagement` database and use it.

## 2 and 3. Create Tables and Insert Data

- Create the `Employee`, `Project`, and `Collaboration` tables.
- Insert sample data into the tables, including employee details, project information, and their collaborations.

## 4. Query: Employees who worked on 'DM'

- Retrieve the names of employees who have worked on the project titled 'Data Management' (DM).

## 5. Query: Projects and working hours for 'Albert'

- Retrieve the project titles and corresponding working hours for the employee named 'Albert'.

## 6. Update: Working hours for 'Daniel' in 'VA'

- Update the working hours of the employee named 'Daniel' for the 'Visual Analytics' (VA) project to 20 hours.

## 8. Insert: Add new collaboration

- Insert a new collaboration record for 'Daniel' on the 'Internet of Things' (IOT) project, adding 10 working hours.

## 9. Query: Number of employees who worked on 'VA'

- Retrieve the number of employees who have worked on the 'Visual Analytics' (VA) project.

## 10. Delete: Collaboration of 'Charlotte' in 'IOT'

- Delete the collaboration record of the employee named 'Charlotte' from the 'Internet of Things' (IOT) project.

## 11. Query: Customers who ordered at least two projects

- Retrieve the names of customers who ordered at least two projects.

## 12. Query: Average working hours for 'Microsoft' projects

- Retrieve the average working hours for all projects ordered by the customer 'Microsoft'.

## 13. Query: Employees who worked on 'VA' for as many hours as 'Albert'

- Retrieve the names of employees who worked on the 'Visual Analytics' (VA) project for as many hours as 'Albert' but exclude 'Albert' from the results.

## 14. Query: Employees working on 'Microsoft' projects

- Retrieve the names of employees who have worked on projects ordered by the customer 'Microsoft'.

## 15. Query: Average working hours per project

- Retrieve the average working hours for each project.

## 16. Query: Count of employees by customer

- Retrieve the number of distinct employees working on projects for each customer.

## 17. Query: Employees with average working hours > 20

- Retrieve the names of employees whose average working hours are greater than 20.

## 18. Query: Lowest working hours per project

- Retrieve the lowest number of working hours for each project.
