# E-commerce Database System(Assignment)

A comprehensive relational database system designed for e-commerce applications as part of PLP Assignment. It supports:

- Product management with brand and category associations
- Product variations based on size and color
- Inventory tracking at the item level
- Detailed attribute and image support for each product


## 🔗 Key Relationships

### **Brand ⇨ Product (One-to-Many)**
- One brand can be associated with many products  
- Each product belongs to exactly one brand  

### **Product Category ⇨ Product (One-to-Many)**
- One category can contain many products  
- Each product belongs to exactly one category  

### **Product ⇨ Product Variation (One-to-Many)**
- One product can have many variations (e.g., size/color combinations)  
- Each variation belongs to exactly one product  

### **Size Category ⇨ Size Option (One-to-Many)**
- One size category can have many specific size options  
- Each size option belongs to exactly one size category  

### **Size Option ⇨ Product Variation (One-to-Many)**
- One size option can appear in many product variations  
- Each product variation uses exactly one size option  

### **Color ⇨ Product Variation (One-to-Many)**
- One color can be used in many product variations  
- Each product variation uses exactly one color  

### **Product Variation ⇨ Product Item (One-to-Many)**
- One product variation can have many inventory items  
- Each product item represents exactly one variation  

### **Product ⇨ Product Item (One-to-Many)**
- One product can have multiple product items  
- Each product item belongs to exactly one product  

### **Product ⇨ Product Attribute (One-to-Many)**
- One product can have many custom attributes  
- Each attribute is associated with one product  

### **Attribute Category ⇨ Product Attribute (One-to-Many)**
- One product attribute category can be reused across many attributes  
- Each product attribute belongs to one attribute category  

### **Attribute Type ⇨ Product Attribute (One-to-Many)**
- One attribute type can be used for many attributes  
- Each product attribute has exactly one type  

### **Product ⇨ Product Image (One-to-Many)**
- One product can have many images  
- Each image is linked to a product  


## ⚙️ Database Constraints

- **Primary Keys:**  
  Each table uses an `AUTO_INCREMENT` integer primary key  

- **Foreign Keys:**  
  All relationships are enforced using foreign key constraints  
 

- **Data Type Constraints:**  
  Tables use appropriate data types:
  - `VARCHAR` for short text
  - `TEXT` for longer descriptions
  - `DECIMAL` for pricing
  - `BOOLEAN` for binary.


