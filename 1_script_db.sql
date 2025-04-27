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



-- DADES DE PROVA
INSERT INTO Suppliers (name, direction, phone_num, fax, nif)
VALUES
  ('Optica Vision', 'Carrer Gran Via, 25, Barcelona, 08001, Espanya', '933000123', '933000124', 'B12345678'),
  ('Vision Perfecta', 'Carrer de Sol, 15, Madrid, 28001, Espanya', '912345678', '912345679', 'B87654321');

INSERT INTO Glasses (brand, left_lens_correction, right_lens_correction, frame_type, frame_color, left_lens_color, right_lens_color, price, supplier_id)
VALUES
  ('Ray-Ban', 1.50, 1.25, 'metal', 'black', 'transparent', 'transparent', 150.00, 1),
  ('Oakley', 0.75, 0.50, 'plastic', 'blue', 'grey', 'grey', 120.00, 2),
  ('Gucci', 2.00, 1.75, 'rimless', 'gold', 'green', 'green', 300.00, 1);

INSERT INTO Customers (name, direction, phone_num, email, registration_date, recommended_by)
VALUES
  ('Juan Pérez', 'Carrer de Pau, 10, Barcelona', '600123456', 'juan.perez@email.com', '2023-01-10', NULL),
  ('Maria López', 'Carrer de Sol, 5, Madrid', '612345678', 'maria.lopez@email.com', '2023-02-15', 1);

INSERT INTO Employees (name)
VALUES
  ('Carlos García'),
  ('Laura Martínez');

INSERT INTO Sales (customer_id, glass_id, employee_id, sell_date)
VALUES
  (1, 1, 1, '2023-01-15'),
  (2, 2, 2, '2023-02-20');


--CONSULTES
SELECT COUNT(*) AS total_sales FROM sales WHERE customer_id = 1 AND sell_date BETWEEN '2023-01-01' AND '2023-12-31';
SELECT DISTINCT glasses.brand FROM sales INNER JOIN glasses ON sales.glass_id = glasses.id WHERE sales.employee_id = 1 AND sales.sell_date BETWEEN '2023-01-01' AND '2023-12-31';
SELECT DISTINCT suppliers.name FROM sales INNER JOIN glasses ON sales.glass_id = glasses.id INNER JOIN suppliers ON glasses.supplier_id = suppliers.id;
