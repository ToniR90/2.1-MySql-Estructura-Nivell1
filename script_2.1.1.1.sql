CREATE DATABASE Cul_d_ampolla;
USE Cul_d_ampolla;

CREATE TABLE Suppliers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  direction VARCHAR(200),
  phone_num VARCHAR(20),
  fax VARCHAR(20),
  nif VARCHAR(20)
);

CREATE TABLE Glasses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  brand VARCHAR(100),
  left_lens_correction DECIMAL(4,2),
  right_lens_correction DECIMAL(4,2),
  frame_type ENUM('rimless', 'plastic', 'metal'),
  frame_color VARCHAR(50),
  left_lens_color VARCHAR(50),
  right_lens_color VARCHAR(50),
  price DECIMAL(8,2),
  supplier_id INT,
  FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
);

CREATE TABLE Customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  direction VARCHAR(200),
  phone_num VARCHAR(20),
  email VARCHAR(100),
  registration_date DATE,
  recommended_by INT,
  FOREIGN KEY (recommended_by) REFERENCES Customers(id)
);

CREATE TABLE Employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE Sales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  glass_id INT,
  employee_id INT,
  sell_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customers(id),
  FOREIGN KEY (glass_id) REFERENCES Glasses(id),
  FOREIGN KEY (employee_id) REFERENCES Employees(id)
);
