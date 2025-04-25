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
