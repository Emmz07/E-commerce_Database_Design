CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);
CREATE TABLE product_image (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE size_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE size_option (
    id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    label VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);
CREATE TABLE product_variation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);
CREATE TABLE product_item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_variation_id INT,
    stock_quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);
CREATE TABLE attribute_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE attribute_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE product_attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(100),
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);


--OR

-- Create and select the ecommerce database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Brand table
CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Product categories
CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Color table
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Size categories
CREATE TABLE size_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Size options
CREATE TABLE size_option (
    id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    label VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- Product table
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Product images
CREATE TABLE product_image (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255),
    is_primary BOOLEAN,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Attribute types
CREATE TABLE attribute_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Attribute categories
CREATE TABLE attribute_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Product attributes
CREATE TABLE product_attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(100),
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

-- Product variations
CREATE TABLE product_variation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

-- Product items
CREATE TABLE product_item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sku VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- -------------------------------------------------
-- Seed Data
-- -------------------------------------------------

-- Brands
INSERT INTO brand (name) VALUES
('Nike'), ('Apple'), ('Samsung');

-- Product Categories
INSERT INTO product_category (name) VALUES
('Clothing'), ('Electronics'), ('Footwear');

-- Colors
INSERT INTO color (name) VALUES
('Red'), ('Blue'), ('Black');

-- Size Categories
INSERT INTO size_category (name) VALUES
('Clothing Sizes'), ('Shoe Sizes');

-- Size Options
INSERT INTO size_option (size_category_id, label) VALUES
(1, 'S'), (1, 'M'), (1, 'L'),
(2, '40'), (2, '42'), (2, '44');

-- Attribute Categories
INSERT INTO attribute_category (name) VALUES
('Physical'), ('Technical');

-- Attribute Types
INSERT INTO attribute_type (name) VALUES
('text'), ('number'), ('boolean');

-- Products
INSERT INTO product (name, brand_id, category_id, base_price, description) VALUES
('Nike Air Max', 1, 3, 120.00, 'Comfortable running shoes'),
('iPhone 15', 2, 2, 999.00, 'Latest iPhone with improved camera'),
('Samsung Galaxy S24', 3, 2, 899.00, 'Flagship phone with dynamic AMOLED');

-- Product Items (Linked to products directly)
INSERT INTO product_item (product_id, sku, price, stock_quantity) VALUES
(1, 'SKU001', 120.00, 50),
(2, 'SKU002', 999.00, 20),
(3, 'SKU003', 899.00, 30);

-- Product Variations (Use correct color_id and size_option_id)
INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES
(1, 3, 5),   -- Black, size '40'
(2, 1, NULL), -- Red, no size (electronics)
(3, 2, NULL); -- Blue, no size (electronics)

-- Product Images
INSERT INTO product_image (product_id, image_url, is_primary) VALUES
(1, 'nike-air-max.jpg', TRUE),
(2, 'iphone-15.jpg', TRUE),
(3, 'galaxy-s24.jpg', TRUE);

-- Product Attributes
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, name, value) VALUES
(1, 1, 1, 'Material', 'Mesh'),
(2, 2, 1, 'Chip', 'A17 Bionic'),
(3, 2, 1, 'Chip', 'Snapdragon 8 Gen 3');
