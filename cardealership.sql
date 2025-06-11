-- Drops the database if it exists
DROP DATABASE IF EXISTS cardealership;

-- Create Dealership database
CREATE DATABASE cardealership;

USE cardealership;

-- Drops the table if they exist
DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_constracts;
DROP TABLE IF EXISTS inventroy;
DROP TABLE IF EXISTS dealership;
DROP TABLE IF EXISTS vehicles;

-- Create the Vehicles Table
CREATE TABLE vehicles(
VIN VARCHAR(17) PRIMARY KEY,		-- Unique ID 
color VARCHAR(50),
make VARCHAR(50),
model VARCHAR(50),
year INT(4),
purchase_price DECIMAL(12, 2),
license_plate VARCHAR(20)
);

-- Create the Dealership Table
CREATE TABLE dealership (
dealership_id INT PRIMARY KEY AUTO_INCREMENT,		-- Unique ID 
name VARCHAR(50) NOT NULL,                     
address VARCHAR(50)NOT NULL,                          
phone VARCHAR(12),  
email VARCHAR(50)NOT NULL       
);

-- Create the Inventroy Table
CREATE TABLE inventory (
dealership_id INT AUTO_INCREMENT NOT NULL,
VIN VARCHAR(17)NOT NULL,
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id),
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create the Lease Table
CREATE TABLE lease_constracts (
lease_contract_id INT PRIMARY KEY AUTO_INCREMENT,		-- Unique ID  
VIN VARCHAR(17) NOT NULL,
lessee_name VARCHAR(100) NOT NULL,
lease_start DATE NOT NULL,                       
lease_end DATE NOT NULL,     
monthly_payment DECIMAL(10,2) NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
-- Create the Sales Table
CREATE TABLE sales_contracts (
sales_contract_id INT PRIMARY KEY AUTO_INCREMENT,		-- Unique ID 
VIN VARCHAR(17) NOT NULL,
buyer_name VARCHAR(100) NOT NULL,              
sale_price DECIMAL(12,2) NOT NULL,              
sale_date DATE NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)    
);

INSERT INTO vehicles (
    VIN, color, make, model, year, purchase_price, license_plate
) VALUES
('1GYS4JKJ4PR123456', 'Black', 'Cadillac', 'Escalade Sport Platinum', 2023, 110000.00, 'REDKNG23'),
('1G1YU2D68P5123456', 'Red', 'Chevrolet', 'Corvette Z06', 2023, 112000.00, 'GOLDZ06'),
('1GYS4DKL3NR654321', 'Satin Steel Metallic', 'Cadillac', 'Escalade Premium Luxury', 2022, 98000.00, 'STLGRY22'),
('1G1YB3D45R5112345', 'White Pearl', 'Chevrolet', 'Corvette Stingray', 2024, 73000.00, 'WHTSTING'),
('1GYS4JKL5MR789012', 'Midnight Blue', 'Cadillac', 'Escalade ESV Sport', 2021, 92000.00, 'BLUNITE'),
('1G1Y72D45L5109876', 'Accelerate Yellow', 'Chevrolet', 'Corvette C8', 2020, 65000.00, 'SUNZC8');

INSERT INTO dealership (
    name, address, phone, email
) VALUES
('Tampa Auto Kings', '123 Success Blvd', '8135551001', 'sales@tampaautokings.com'),
('Z06 Performance Motors', '456 Speed Lane', '7275552023', 'info@z06performance.com'),
('Escalade Empire', '789 Royal Drive', '4075559087', 'contact@escaladeempire.com'),
('Luxury Drive Tampa', '321 Prestige Ave', '8135553344', 'lux@luxurydrivetampa.com'),
('Corvette Showcase', '999 Track St', '8135557788', 'team@corvetteshowcase.com'),
('Elite Auto Gallery', '555 Dream Blvd', '3055552121', 'hello@eliteautogallery.com');

INSERT INTO inventory (dealership_id, VIN) VALUES
(3, '1GYS4JKJ4PR123456'),
(2, '1G1YU2D68P5123456'),
(3, '1GYS4DKL3NR654321'),
(2, '1G1YB3D45R5112345'),
(3, '1GYS4JKL5MR789012'),
(2, '1G1Y72D45L5109876');

INSERT INTO lease_constracts (
    VIN, lessee_name, lease_start, lease_end, monthly_payment
) VALUES
('1GYS4JKJ4PR123456', 'Jordan Maxwell', '2025-06-01', '2028-06-01', 1450.00),
('1G1YU2D68P5123456', 'Celeste Turner', '2024-08-15', '2027-08-15', 1550.00),
('1GYS4DKL3NR654321', 'Ariana Blake', '2024-09-15', '2027-09-15', 1320.00),
('1G1YB3D45R5112345', 'Kyla Morgan', '2025-01-05', '2026-12-31', 980.00),
('1GYS4JKL5MR789012', 'Dante Rivers', '2023-11-10', '2026-11-10', 1200.00),
('1G1Y72D45L5109876', 'Marcus Lane', '2024-03-20', '2026-03-20', 860.00);

INSERT INTO sales_contracts (
    VIN, buyer_name, sale_price, sale_date
) VALUES
('1GYS4JKJ4PR123456', 'Elijah Grant', 108500.00, '2024-12-20'),
('1G1YU2D68P5123456', 'Monica Hayes', 111000.00, '2025-01-15'),
('1GYS4DKL3NR654321', 'Isaiah Cole', 97000.00, '2024-06-30'),
('1G1YB3D45R5112345', 'Alina Frost', 72000.00, '2025-04-03'),
('1GYS4JKL5MR789012', 'Derrick Young', 91500.00, '2024-11-10'),
('1G1Y72D45L5109876', 'Tasha Reed', 64000.00, '2024-07-25');
