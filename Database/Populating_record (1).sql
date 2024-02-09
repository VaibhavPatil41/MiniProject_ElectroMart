CREATE TABLE user(
  id INT NOT NULL AUTO_INCREMENT primary key,
  name VARCHAR(25) NOT NULL,
  address VARCHAR(50) NOT NULL,
  email_id VARCHAR(40) NOT NULL UNIQUE,
  date_of_birth DATE NOT NULL,
  gender CHAR(1) NOT NULL,
  mobile_num VARCHAR(12) NOT NULL UNIQUE,
  role ENUM('Admin', 'Customer', 'Vendor') NOT NULL,
  status TINYINT NOT NULL
);

CREATE TABLE Admin (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  PRIMARY KEY (id),
  
  CONSTRAINT fk_Admin_user1
    FOREIGN KEY (user_id)
    REFERENCES user (id)
);

CREATE TABLE customer (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_custemer_user1
    FOREIGN KEY (user_id)
    REFERENCES user (id)
);

CREATE TABLE wallet (
  id INT NOT NULL AUTO_INCREMENT,
  balance_amount FLOAT NOT NULL DEFAULT(1000),
  user_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_wallet_user1
    FOREIGN KEY (user_id)
    REFERENCES user(id)
);

CREATE TABLE Vendor (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_Vendor_user
    FOREIGN KEY (user_id)
    REFERENCES user (id)
);

CREATE TABLE vendor_feedback (
  id INT NOT NULL AUTO_INCREMENT,
  rating INT NOT NULL,
  discription VARCHAR(45) NULL,
  Vendor_id INT NOT NULL UNIQUE,
  customer_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_vendor_feedback_customer1
    FOREIGN KEY (customer_id)
    REFERENCES customer (id),
  CONSTRAINT fk_vendor_id
    FOREIGN KEY (Vendor_id)
    REFERENCES Vendor (id)
);



CREATE TABLE category (
  id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NOT NULL,
  product_price FLOAT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_products_category1
    FOREIGN KEY (category_id)
    REFERENCES category (id)
);



CREATE TABLE shop (
  id INT NOT NULL AUTO_INCREMENT,
  shop_name VARCHAR(30) NOT NULL,
  address VARCHAR(45) NOT NULL,
  licence_id INT NOT NULL,
  products_qty INT NOT NULL,
  Category_id INT NOT NULL,
   products_id INT NOT NULL,
  Vendor_id INT NOT NULL,
  PRIMARY KEY (id),
 
  CONSTRAINT fk_shop_products1
    FOREIGN KEY (products_id)
    REFERENCES products (id),
	
  CONSTRAINT fk_shop_category1
    FOREIGN KEY (category_id)
    REFERENCES category (id),
  
  CONSTRAINT fk_shop_Vendor1
    FOREIGN KEY (Vendor_id)
    REFERENCES  Vendor (id)
);


CREATE TABLE cart (
  id INT NOT NULL AUTO_INCREMENT,
  quantity INT NOT NULL,
  customer_id INT NOT NULL,
  products_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cart_customer1
    FOREIGN KEY (customer_id)
    REFERENCES  customer (id),

  CONSTRAINT fk_cart_products1
    FOREIGN KEY (products_id)
    REFERENCES products (id)
);

CREATE TABLE electro_mart.order(
  id INT NOT NULL,
  cart_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT cart_id
    FOREIGN KEY (cart_id)
    REFERENCES cart (id)
    
);