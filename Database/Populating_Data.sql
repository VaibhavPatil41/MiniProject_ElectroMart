INSERT INTO User (name, address, email_id, date_of_birth, gender, mobile_num, role, status)
VALUES
('Rajesh Kumar', 'Pune 416112', 'rajesh.k@email.com', '1985-05-15', 'M', '9876543210', 'Admin', 1),
('Priya Sharma', 'Mumbai', 'priya.s@email.com', '1990-08-21', 'F', '9876543211', 'Customer', 1),
('Amit Singh', 'Kolhapur', 'singhamit@email.com', '1988-03-10', 'M', '9876543212', 'Vendor', 1),
('Anita Verma', 'Kolhapur', 'ani.va@email.com', '1992-11-28', 'F', '9876543213', 'Customer', 1),
('Vijay Patel', 'Nagpur', 'patel.v@email.com', '1995-07-02', 'M', '9876543214', 'Customer', 1),
('Neha Gupta', 'Pune', 'nehu.g@email.com', '1982-09-17', 'F', '9876543215', 'Vendor', 1),
('Admin Kumar', 'Mumbai', 'kumar@email.com', '1980-01-01', 'M', '9876543216', 'Customer', 1),
('Arun Yadav', 'Kolkata', 'yad.A@email.com', '1993-06-05', 'M', '9876543217', 'Customer', 1),
('Pooja Mishra', 'Mumbai', 'pm@email.com', '1987-04-12', 'F', '9876543218', 'Customer', 1),
('Arjun Gupta', 'Nashik', 'a.put@email.com', '1991-02-28', 'M', '9876543219', 'Vendor', 1),
('Nisha Kapoor', 'Pune', 'n.kapoor@email.com', '1983-10-20', 'F', '9876543220', 'Customer', 1),
('Rahul Shah', 'Pune', 'r.shah@email.com', '1994-09-15', 'M', '9876543221', 'Customer', 1),
('Anjali Desai', 'Kolhapur', 'a.desai@email.com', '1986-07-07', 'F', '9876543222', 'Customer', 1),
('Sandeep Verma', 'Satara', 'san.verma@email.com', '1980-11-03', 'M', '9876543223', 'Customer', 1),
('Riya Gupta', 'Sangali', 'r.gupta@email.com', '1996-03-25', 'F', '9876543224', 'Customer', 1),
('Amita Patel', 'Pune', 'a.patel@email.com', '1989-06-18', 'M', '9876543225', 'Customer', 1);

-- Wallet, Admin, Customer & Vendor Tables gets populated because of triggers 

INSERT INTO category (category_name) VALUES
('Mobiles and Tablets'),
('Televisions'),
('Audio and Video'),
('Accessories'),
('Computers');

-- 

INSERT INTO products (product_name,product_price,category_id) VALUES
('iPhone 13', 6500,1),
('Samsung Galaxy Tab S7',7000, 1),
('Google Pixel 6',6800,1),
('iPad Air',5800,1),
('OnePlus 9',4500,1);


INSERT INTO products (product_name,product_price,category_id) VALUES
('Sony Bravia 4K OLED TV',8999,2),
('LG NanoCell TV',7899,2),
('Samsung 8K QLED TV',6899,2),
('TCL Roku Smart TV',6599,2),
('Vizio 55-inch LED TV',7000,2);


INSERT INTO products (product_name,product_price,category_id) VALUES
('Bose QuietComfort 35 II',1999,3),
('Sony WH-1000XM4',1250,3),
('JBL Charge 4 Bluetooth Speaker',1399, 3),
('GoPro Hero 10 Black',2500,3),
('Canon EOS R5 Mirrorless Camera',2999,3);


INSERT INTO products (product_name,product_price, category_id) VALUES
('Apple AirPods Pro',1500,4),
('Logitech MX Master 3 Mouse',799,4),
('Anker Wireless Charger',499,4),
('AmazonBasics Laptop Sleeve',199,4),
('Samsung Galaxy Watch 4',1200,4);


INSERT INTO products (product_name,product_price,category_id) VALUES
('Dell XPS 15',8999,5),
('MacBook Pro 16-inch',9899,5),
('HP Spectre x360',7899,5),
('Lenovo ThinkPad X1 Carbon',6899,5),
('Asus ROG Zephyrus G14',7699,5);


--

INSERT INTO shop (shop_name, address, Vendor_id, licence_id, category_id, products_id, products_qty) VALUES
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 1, 2, 28),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 1, 1, 20),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 1, 3, 30),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 1, 4, 22),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 1, 5, 26),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 2, 6, 20),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 2, 7, 27),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 2, 8, 35),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 2, 9, 21),
('Gadget Hub', '12 Tech Street, Mumbai, Maharashtra', 1, '987654', 2, 10, 26),



('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 3, 11, 35),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 3, 12, 27),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 3, 13, 25),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 3, 14, 15),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 3, 15, 21),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 4, 16, 35),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 4, 17, 27),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 4, 18, 25),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 4, 19, 15),
('Digital Delights', '34 Innovation Road, Bangalore, Karnataka', 2, '654321', 4, 20, 21),


('Electro Emporium', '56 Electronics Avenue, Delhi, Delhi', 3, '123456', 5, 21, 28),
('Electro Emporium', '56 Electronics Avenue, Delhi, Delhi', 3, '123456', 5, 22, 30),
('Electro Emporium', '56 Electronics Avenue, Delhi, Delhi', 3, '123456', 5, 23, 35),
('Electro Emporium', '56 Electronics Avenue, Delhi, Delhi', 3, '123456', 5, 24, 27),
('Electro Emporium', '56 Electronics Avenue, Delhi, Delhi', 3, '123456', 5, 25, 21);