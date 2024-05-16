# SIS-Part-2-in-SQL

## Contributor

- Rutvik Gandhi

## Script Overview

The script contains SQL queries to retrieve specific data from various tables in the `SIS` database. Each query addresses a particular question or requirement related to course information, prerequisites, employee data, student payments, and more.

## Contents of the Script

### Data Retrieval Queries

1. Retrieve courses for the program code '0066C', including school code, program code, course number, and semester, ordered by semester and course number.
2. List required course prerequisites for COMP2280, including course code, prerequisite, and prerequisite course names, ordered by prerequisite course code in descending order.
3. Retrieve persons from the Person table who are not students, including person number, first name, last name, and city, ordered by last name.
4. List lab software installed on machines in room 2A205, including software package unique identifiers and software product names, ordered by software product name.
5. Show employee numbers and their respective supervisors' numbers and the supervisors' supervisors' numbers, ordered by supervisor number, using left outer self-join.
6. Display course offerings for the Winter 2010 session, including course numbers, minimum, average, and maximum final marks for courses, grouped by course number.
7. List the number of courses taught by employees in the School of Engineering and IT (EIT) for courses offered in any semester of 2008 or 2009, including employee number, user ID, and count of courses taught, ordered by user ID.
8. Produce a list of co-op programs and their total tuition fees over all semesters, including program acronym, program name, and total fees, formatted in dollars and cents.
9. Retrieve students who have made payments by cheque or cash only, including student number, last name, first name, and total payment amount, for students with a total payment amount of at least $10,000.00, ordered by total payment amount in descending order.

## How to Use the Script

1. Open your preferred SQL client or environment.

2. Connect to the appropriate database server and select the `SIS` database.

3. Load the script `Assignment2_RG.sql` into your SQL client.

4. Execute the script to run the SQL queries and retrieve the desired data from the `SIS` database.

5. Review the results of each query to obtain the requested information.

## Additional Notes

- Ensure that your SQL environment has sufficient privileges to execute the queries and access the necessary tables in the `SIS` database.

## License

This script is provided under the MIT License. See the [LICENSE](LICENSE) file for details.
