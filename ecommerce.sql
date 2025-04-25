-- Group Assignment

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE brand(
brand_id INT PRIMARY KEY AUTO_INCREMENT,
brand_name VARCHAR(100),
brand_url VARCHAR(255),
brand_description TEXT
);


CREATE TABLE attributeCategory(
attribute_id INT PRIMARY KEY AUTO_INCREMENT,
attribute_name VARCHAR(100)
);

CREATE TABLE attributeType(
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(50)
);

CREATE TABLE productCategory(
category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(100),
category_description TEXT
);

CREATE TABLE product(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(100),
product_description TEXT,
base_price DECIMAL(10,2),
brand_id INT,
category_id INT,
FOREIGN KEY (brand_id) references brand(brand_id),
FOREIGN KEY (category_id) references productCategory(category_id)
);

CREATE TABLE sizeCategory(
size_category_id INT PRIMARY KEY AUTO_INCREMENT,
size_category_name VARCHAR(100)
);


CREATE TABLE sizeOption(
size_id INT PRIMARY KEY AUTO_INCREMENT,
size_label VARCHAR(50),
size_category_id int,
FOREIGN KEY (size_category_id) REFERENCES sizeCategory(size_category_id)
);

CREATE TABLE color(
color_id INT PRIMARY KEY AUTO_INCREMENT,
color_name VARCHAR(50),
hex_value 	VARCHAR(10)
);

CREATE TABLE productVariation(
variation_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
size_id INT,
color_id INT,
FOREIGN KEY (product_id) REFERENCES product(product_id),
FOREIGN KEY (size_id) REFERENCES sizeOption(size_id),
FOREIGN KEY (color_id) REFERENCES color(color_id)
);

CREATE TABLE productItem(
item_id INT PRIMARY KEY AUTO_INCREMENT,
status VARCHAR(50),
quantity_in_stock INT,
product_id INT,
variation_id INT,
FOREIGN KEY (product_id) REFERENCES product(product_id),
FOREIGN KEY (variation_id) REFERENCES productVariation(variation_id)
);


CREATE TABLE productAttribute(
product_attribute_id  INT PRIMARY KEY AUTO_INCREMENT,
product_attribute_name VARCHAR(50),
value VARCHAR(150),
product_id INT,
attribute_id INT,
type_id INT,
FOREIGN KEY (product_id) REFERENCES product(product_id),
FOREIGN KEY (attribute_id) REFERENCES attributeCategory(attribute_id),
FOREIGN KEY (type_id) REFERENCES attributeType(type_id)
);

CREATE TABLE productImage(
image_id  INT PRIMARY KEY AUTO_INCREMENT,
image_url VARCHAR(255),
alt_text TEXT,
product_id INT,
FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- Brand Table
INSERT INTO brand (brand_name, brand_url, brand_description) VALUES
("Nike", "https://www.nike.com", "Global sports apparel and footwear manufacturer"),
("Apple", "https://www.apple.com", "Consumer electronics and software company"),
("Samsung", "https://www.samsung.com", "Electronics manufacturer specializing in consumer electronics and appliances"),
("Adidas", "https://www.adidas.com", "Sportswear and athletic equipment manufacturer"),
("Sony", "https://www.sony.com", "Multinational conglomerate specializing in electronics and entertainment"),
("H&M", "https://www.hm.com", "Fast fashion retail company offering trendy clothing at affordable prices"),
("IKEA", "https://www.ikea.com", "Swedish furniture and home accessories retailer"),
("Dell", "https://www.dell.com", "Computer technology company specializing in PCs and related products"),
("Zara", "https://www.zara.com", "Spanish clothing and accessories retailer known for fast fashion"),
("LG", "https://www.lg.com", "South Korean electronics company producing a wide range of appliances"),
("Puma", "https://www.puma.com", "Athletic footwear and sportswear manufacturer"),
("Microsoft", "https://www.microsoft.com", "Technology company specializing in software, hardware, and services"),
("Levis", "https://www.levis.com", "American clothing company known for its denim jeans"),
("Canon", "https://www.canon.com", "Japanese multinational corporation specializing in optical and imaging products"),
("Uniqlo", "https://www.uniqlo.com", "Japanese casual wear designer and retailer");

INSERT INTO attributeCategory (attribute_name) VALUES
("Material"),
("Memory"),
("Storage"),
("Weight"),
("Dimensions"),
("Processor"),
("Resolution"),
("Battery Life"),
("Water Resistance"),
("Connectivity"),
("Screen Size"),
("Fabric Type"),
("Closure Type"),
("Warranty Period"),
("Operating System");

-- Attribute Type Table
INSERT INTO attributeType (type_name) VALUES
("Text"),
("Number"),
("Boolean"),
("Date"),
("Time"),
("DateTime"),
("Email"),
("URL"),
("Color"),
("Size"),
("Range"),
("Currency"),
("Percentage"),
("Duration"),
("Dimension");

-- Product Category Table
INSERT INTO productCategory (category_name, category_description) VALUES
("Smartphones", "Mobile phones with advanced computing capabilities"),
("Laptops", "Portable computers suitable for mobile use"),
("Footwear", "Items worn on feet including shoes, boots, and sandals"),
("Clothing", "Garments worn on the body"),
("Home Appliances", "Electrical or mechanical machines for household functions"),
("Audio", "Devices for capturing, recording, and reproducing sound"),
("Gaming", "Video game consoles, accessories, and games"),
("Furniture", "Movable objects intended to support human activities"),
("Cameras", "Optical instruments for capturing images or videos"),
("Watches", "Wearable timepieces for the wrist"),
("Accessories", "Items that complement or enhance other products"),
("TVs", "Television sets and related equipment"),
("Kitchen", "Appliances and items used in cooking and food preparation"),
("Fitness", "Equipment used for physical exercise and health monitoring"),
("Outdoor", "Products designed for outdoor activities and spaces");

-- Size Category Table
INSERT INTO sizeCategory (size_category_name) VALUES
("African print"),
("Smocks"),
("Men's Running Shoes"),
("Women's Running Shoes"),
("EU Shoes"),
("Laptop Screen"),
("TV Screen"),
("Smartphone Screen"),
("Bed Sizes"),
("Table Dimensions"),
("Storage Capacity"),
("Weight Category"),
("Volume Measurement"),
("Ring Sizes"),
("Height Category");

-- Size Option Table
INSERT INTO sizeOption (size_label, size_category_id) VALUES
("S", 1),
("M", 1),
("L", 1),
("XL", 1),
("38", 2),
("40", 2),
("S", 2),
("L", 3),
("9", 3),
("M", 3),
("6", 4),
("L", 4),
("8", 4),
("39", 5),
("40", 5);

-- Color Table
INSERT INTO color (color_name, hex_value) VALUES
("Black", "#000000"),
("White", "#FFFFFF"),
("Red", "#FF0000"),
("Blue", "#0000FF"),
("Green", "#00FF00"),
("Yellow", "#FFFF00"),
("Purple", "#800080"),
("Orange", "#FFA500"),
("Pink", "#FFC0CB"),
("Gray", "#808080"),
("Brown", "#A52A2A"),
("Navy", "#000080"),
("Teal", "#008080"),
("Gold", "#FFD700"),
("Silver", "#C0C0C0");

-- Product Table
INSERT INTO product (product_name, product_description, base_price, brand_id, category_id) VALUES
("iPhone 14 Pro", "Latest flagship iPhone with advanced camera system", 999.99, 2, 1),
("Galaxy S23", "Samsung's premium smartphone with high-performance specs", 899.99, 3, 1),
("MacBook Air M2", "Thin and light laptop with Apple silicon", 1199.99, 2, 2),
("XPS 13", "Dell's ultraportable premium laptop", 1299.99, 8, 2),
("Air Jordan 1", "Iconic basketball sneakers", 180.00, 1, 3),
("Stan Smith", "Classic tennis shoes with clean design", 85.00, 4, 3),
("Ultra Boost", "Running shoes with responsive cushioning", 180.00, 4, 3),
("Cotton T-Shirt", "Basic crew neck cotton t-shirt", 19.99, 6, 4),
("Slim Fit Jeans", "Classic 5-pocket jeans with slim fit", 59.99, 13, 4),
("Smart TV 55", "4K Ultra HD Smart TV with voice control", 699.99, 5, 12),
("Wireless Headphones", "Over-ear noise cancelling headphones", 249.99, 5, 6),
("Gaming Console", "Next-gen gaming system with 4K capabilities", 499.99, 5, 7),
("KALLAX Shelf Unit", "Versatile storage solution with cube compartments", 79.99, 7, 8),
("DSLR Camera", "Professional-grade digital single-lens reflex camera", 899.99, 14, 9),
("Smartwatch", "Fitness and health tracking wearable device", 299.99, 3, 10);

-- Product Variation
INSERT INTO productVariation (product_id, size_id, color_id) VALUES
(1, NULL, 1), 
(1, NULL, 2), 
(1, NULL, 3), 
(2, NULL, 1),
(2, NULL, 2), 
(3, NULL, 1), 
(3, NULL, 2), 
(4, NULL, 10),
(5, 9, 1), 
(5, 9, 3), 
(5, 10, 1), 
(6, 9, 2),
(7, 10, 4), 
(8, 1, 2), 
(8, 2, 2); 

-- Product Item 
INSERT INTO productItem (status, quantity_in_stock, product_id, variation_id) VALUES
("In Stock", 50, 1, 1),
("In Stock", 45, 1, 2),
("Low Stock", 30, 1, 3),
("In Stock", 40, 2, 4),
("In Stock", 35, 2, 5),
("Low Stock", 25, 3, 6),
("In Stock", 30, 3, 7),
("In Stock", 20, 4, 8),
("In Stock", 15, 5, 9),
("Low Stock", 5, 5, 10),
("In Stock", 10, 5, 11),
("In Stock", 20, 6, 12),
("In Stock", 15, 7, 13),
("Low Stock", 100, 8, 14),
("In Stock", 95, 8, 15);

-- Product Attribute
INSERT INTO productAttribute (product_attribute_name, value, product_id, attribute_id, type_id) VALUES
("RAM", "6GB", 1, 2, 2), 
("Storage", "256GB", 1, 3, 2), 
("Processor", "A16 Bionic", 1, 6, 1),
("RAM", "8GB", 2, 2, 2), 
("Storage", "128GB", 2, 3, 2), 
("RAM", "16GB", 3, 2, 2), 
("Storage", "512GB", 3, 3, 2), 
("Material", "Leather", 5, 1, 1), 
("Material", "Cotton", 8, 1, 1), 
("Screen Size", "55 inches", 10, 11, 2),
("Resolution", "4K Ultra HD", 10, 7, 1),
("Battery Life", "30 hours", 11, 8, 2), 
("Storage", "1TB", 12, 3, 2), 
("Material", "Particleboard", 13, 1, 1), 
("Resolution", "24.1 Megapixels", 14, 7, 2); 

-- Product Image
INSERT INTO productImage (image_url, alt_text, product_id) VALUES
("https://example.com/images/iphone-14-pro-black.jpg", "iPhone 14 Pro in Black", 1),
("https://example.com/images/iphone-14-pro-white.jpg", "iPhone 14 Pro in White", 1),
("https://example.com/images/iphone-14-pro-red.jpg", "iPhone 14 Pro in Red", 1),
("https://example.com/images/galaxy-s23-black.jpg", "Galaxy S23 in Black", 2),
("https://example.com/images/galaxy-s23-white.jpg", "Galaxy S23 in White", 2),
("https://example.com/images/macbook-air-m2-black.jpg", "MacBook Air M2 in Black", 3),
("https://example.com/images/macbook-air-m2-white.jpg", "MacBook Air M2 in White", 3),
("https://example.com/images/xps-13-gray.jpg", "Dell XPS 13 in Gray", 4),
("https://example.com/images/air-jordan-1-black.jpg", "Air Jordan 1 in Black", 5),
("https://example.com/images/air-jordan-1-red.jpg", "Air Jordan 1 in Red", 5),
("https://example.com/images/stan-smith-white.jpg", "Stan Smith in White", 6),
("https://example.com/images/ultra-boost-blue.jpg", "Ultra Boost in Blue", 7),
("https://example.com/images/cotton-tshirt-white.jpg", "Cotton T-Shirt in White", 8),
("https://example.com/images/slim-fit-jeans.jpg", "Slim Fit Jeans", 9),
("https://example.com/images/smart-tv-55.jpg", "55-inch Smart TV", 10);
