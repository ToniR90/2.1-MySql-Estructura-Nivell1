# 2.1: MySql Structure (Optic Exercise)

This project is a solution for managing an optical store called **Cul d'Ampolla**. The database stores information about suppliers, glasses, customers, employees, and sales.

## System Description

The goal of this system is to manage the sales and related information of customers and glasses. Glasses products with their details (brand, lens correction, frame type, etc.) are registered, as well as the suppliers who provide these products, the customers who buy the glasses, and the employees who handle the sales.

### Tables

1. **Suppliers**: Contains information about the glasses suppliers.
2. **Glasses**: Contains information about the available glasses in the store.
3. **Customers**: Stores the details of the customers, including who referred them.
4. **Employees**: Stores the information about the employees who handle the sales.
5. **Sales**: Stores the sales transactions, including which glasses a customer bought and which employee processed the sale.


## How to run

### 1. Create the Database

First, create the `Cul_d_ampolla` database with the following SQL script:

```sql
CREATE DATABASE Cul_d_ampolla;
USE Cul_d_ampolla;
```


### 2. Create the tables

Copy the .sql file on: 2.1-MySql-Estructura-Nivell1/script_2.1.1.1.sql

### 3. Insert Sample data

-- Add Supplier
INSERT INTO Suppliers (name, direction, phone_num, fax, nif) 
VALUES ('Eyewear Supplier S.A.', 'Example Street, 123, 2nd Floor, Barcelona, 08001', '123456789', '987654321', 'B12345678');

-- Add Glasses
INSERT INTO Glasses (brand, left_lens_correction, right_lens_correction, frame_type, frame_color, left_lens_color, right_lens_color, price, supplier_id) 
VALUES ('Example Brand', 1.00, -1.50, 'plastic', 'Black', 'Blue', 'Green', 150.00, 1);

### 4. Query data

To view the inserted data, you can run queries like these:
SELECT * FROM Suppliers;
SELECT * FROM Glasses;
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Sales;


## Tools used

- MySQL: Relational database used to store the data.

- MySQL Workbench: Tool used for designing and managing the database.

- dbdiagram.io (if used): Tool for creating relational database diagrams.


