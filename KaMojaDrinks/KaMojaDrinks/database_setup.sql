-- KaMojaDrinks Database Setup Script
-- Run this script in MySQL to create the required database and tables

-- Create database
CREATE DATABASE IF NOT EXISTS KaMojaDrinksDB;
USE KaMojaDrinksDB;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    county VARCHAR(50) NOT NULL,
    role VARCHAR(20) DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create drinks table
CREATE TABLE IF NOT EXISTS drinks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create branches table
CREATE TABLE IF NOT EXISTS branches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    branch_id INT,
    phone VARCHAR(20),
    delivery_address TEXT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Create order_items table
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    drink_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (drink_id) REFERENCES drinks(id)
);

-- Create branch_inventory table
CREATE TABLE IF NOT EXISTS branch_inventory (
    branch_id INT,
    drink_id INT,
    quantity INT DEFAULT 0,
    PRIMARY KEY (branch_id, drink_id),
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (drink_id) REFERENCES drinks(id)
);

-- Insert sample data
INSERT INTO drinks (name, price, stock) VALUES 
('Classic Cola', 199.00, 100),
('Lemon Iced Tea', 249.00, 80),
('Cold Brew Coffee', 299.00, 60);

INSERT INTO branches (name, location) VALUES 
('Nairobi Main', 'Nairobi CBD'),
('Mombasa Branch', 'Mombasa City'),
('Kisumu Branch', 'Kisumu City'),
('Nakuru Branch', 'Nakuru City');

-- Insert sample branch inventory
INSERT INTO branch_inventory (branch_id, drink_id, quantity) VALUES 
(1, 1, 50), (1, 2, 40), (1, 3, 30),
(2, 1, 30), (2, 2, 25), (2, 3, 20),
(3, 1, 25), (3, 2, 20), (3, 3, 15),
(4, 1, 20), (4, 2, 15), (4, 3, 10);

-- Create admin user (password: admin123)
INSERT INTO users (name, email, password_hash, county, role) VALUES 
('Admin User', 'admin@kamojadrinks.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Nairobi', 'admin'); 