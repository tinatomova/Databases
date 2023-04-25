# Museum Database Project
This project is a database system for a museum. The system is designed to store and manage information about museum exhibits, visitors, staff, and other related entities. The project was developed using the MySQL relational database management system.

## Database Schema
* Museum
* Exhibition
* Exhibit
* Employee
* Visitors
* Item

### MUSEUM
* NAME -  primary key
* ADDRESS 
* WEBSITE
* ESTABLISHED - year of establishment
* TYPE 
* EMPLOYEE_COUNT
### EXHIBITION 
* NAME, MUSEUM_NAME - primary key
* NAME 
* MUSEUM_NAME - foreign key to NAME.MUSEUM
* FLOOR 
* AUDITORIUM 
* EXHIBIT_COUNT 
### EXHIBIT
* ID - primary key
* NAME 
* MUSEUM_NAME - foreign key to NAME.MUSEUM
* EXHIBITION_NAME - foreign key to NAME.EXHIBITION
* YEAR - year of creation
* AGE - 'ВС' or 'АС'
* CONDITION - number from 1 to 5; 1-very good, 5-very bad
* COUNTRY 
### EMPLOYEE
* ID - primary key
* NAME 
* MUSEUM_NAME - foreign key to NAME.MUSEUM
* POSITION 
* TELEPHONE
* SALARY
### VISITORS 
* DATE, MUSEUM_NAME - primary key
* DATE - month and year
* MUSEUM_NAME - foreign key to NAME.MUSEUM
* VISITORS_COUNT - number of visitors for the month
### ITEM
* ID - primary key
* MUSEUM_NAME - foreign key to NAME.MUSEUM
* COUNT - number of items for the month
* PRICE 
* TYPE 
