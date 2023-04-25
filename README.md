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
NAME - име, първичен ключ
ADDRESS - адрес
WEBSITE - уебсайт
ESTABLISHED - година на основаване
TYPE - вид
EMPLOYEE_COUNT - брой на персонала
### EXHIBITION 
NAME и MUSEUM_NAME образуват първичен ключ
NAME - име
MUSEUM_NAME - име на музея, външен ключ към NAME.MUSEUM
FLOOR - етаж
AUDITORIUM - зала
EXHIBIT_COUNT - брой на експонатите
### EXHIBIT
ID - идентификационен номер, първичен ключ
NAME - име
MUSEUM_NAME - име на музея, външен ключ към NAME.MUSEUM
EXHIBITION_NAME - име на изложбата, външен ключ към NAME.EXHIBITION
YEAR - датира от
AGE - епоха ('ВС'-преди христа, 'АС'-след христа)
CONDITION - състояние (от 1 до 5; 1-много добро, 5-много лошо)
COUNTRY - държава
### EMPLOYEE
ID - идентификационен номер, първичен ключ
NAME - име
MUSEUM_NAME - име на музея, външен ключ към NAME.MUSEUM
POSITION - длъжност
TELEPHONE - телефонен номер
SALARY - месечна заплата
### VISITORS - DATE и MUSEUM_NAME образуват първичен ключ
DATE - месец и година
MUSEUM_NAME - име на музея, външен ключ към NAME.MUSEUM
VISITORS_COUNT - брой на посетителите за месеца
### ITEM
ID - идентификационен номер, първичен ключ
MUSEUM_NAME - име на музея, външен ключ към NAME.MUSEUM
COUNT - брой на атрибутите за месеца
PRICE - цена
TYPE - вид

