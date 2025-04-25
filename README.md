
# E-Commerce Database Project
This project is a comprehensive SQL-based database design for an e-commerce platform. It includes a fully normalized schema that handles products, brands, categories, attributes, images, and sizes.

## Project Group
**Group 246**

## Contributors

- **Ojo Emmanuel** - [ojoemmanueltiwalade@gmail.com](mailto:ojoemmanueltiwalade@gmail.com)  
- **Kirika Saraphina** - [saraphinakirika@gmail.com](mailto:saraphinakirika@gmail.com)

## Overview
This project involves designing and implementing a comprehensive e-commerce database to support an online store. The database is designed to handle products, orders, users, payments, and more, with a focus on scalability, efficient data management, and robust relationships.

## Features
- **Product Catalog**: Manage products, categories, brands, and variations (e.g., colors, sizes).
- **User Management**: Store user details, including order and payment history.
- **Inventory System**: Track product quantities, orders, and shipping details.
- **Reviews & Ratings**: Allow customers to rate and review products.
- **Shipping & Payments**: Handle shipping addresses, payment statuses, and tracking information.

## Project Structure
The project is organized into the following components:
1. **Entity-Relationship Diagram (ERD)**: A visual representation of the database schema, showing relationships between tables.
2. **SQL Schema**: SQL scripts to create tables, define primary and foreign keys, and enforce constraints.
3. **Sample Data**: SQL scripts to populate the database with realistic test data.

## Database Tables
The database includes the following tables:
- **brand**: Stores brand details.
- **product_category**: Stores product categories (e.g., clothing, electronics).
- **product**: Stores details of individual products.
- **product_item**: Represents purchasable items (e.g., size, color).
- **product_variation**: Links product items to their variations (e.g., color, size).
- **product_image**: Stores product image URLs.
- **product_attribute**: Stores custom product attributes (e.g., material, weight).
- **user**: Stores user information.
- **order**: Stores orders made by users.
- **order_items**: Stores individual items in an order.
- **payment**: Stores payment information for orders.
- **shipping**: Stores shipping details for each order.

## Setup & Installation

### Prerequisites
- **MySQL** (or any compatible RDBMS)
- **Git** to clone the repository

### Steps to Set Up the Database
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/ecommerce-database.git
   ```
2. Import the SQL schema and sample data:
   - Open MySQL or your preferred database management tool.
   - Execute the `ecommerce.sql` file to create the tables:
     ```sql
     source ecommerce.sql;
     ```
   - Optionally, run the `sample_data.sql` file to populate the database with sample data:
     ```sql
     source sample_data.sql;
     ```

After running the SQL scripts, the database will be ready to use.

## Database Design

### Entity-Relationship Diagram (ERD)
The ERD provides a visual representation of the database schema, showing the relationships between tables. [Include a link or image of the ERD here.]

### Entity Relationships
1. brand ↔ product
## One-to-Many

A brand can have many products.

A product belongs to one brand.

Foreign Key: product.brand_id → brand.id

2. product_category ↔ product
## One-to-Many

A category can include many products.

A product belongs to one category.

Foreign Key: product.category_id → product_category.id

3. color
Although color is defined, it is not yet directly used in the product or other tables. If you plan to use colors for product variants or filtering, you might relate it to products or product_attribute in future updates.

4. size_category ↔ size_option
## One-to-Many

A size category (e.g., Shoes) can have many size options (e.g., 42, 43).

Foreign Key: size_option.size_category_id → size_category.id

5. product ↔ product_image
## One-to-Many

A product can have many images.

Each image belongs to one product.

Foreign Key: product_image.product_id → product.id

6. attribute_type ↔ product_attribute
## One-to-Many

An attribute type (e.g., text, number) can be assigned to many product attributes.

Foreign Key: product_attribute.attribute_type_id → attribute_type.id

7. attribute_category ↔ product_attribute
## One-to-Many

An attribute category (e.g., Specifications) can be assigned to many attributes.

Foreign Key: product_attribute.attribute_category_id → attribute_category.id

8. product ↔ product_attribute
## One-to-Many

A product can have many attributes (e.g., RAM, Material, Warranty).

Foreign Key: product_attribute.product_id → product.id

### Summary of Relationship Types

Relationship Type	From	To
One-to-Many	brand -	product
One-to-Many	product_category - product
One-to-Many	size_category - size_option
One-to-Many	product - product_image
One-to-Many	product - product_attribute
One-to-Many	attribute_type -	product_attribute
One-to-Many	attribute_category - product_attribute


## License

This project is for academic purposes and is free to use and modify for learning and development.

