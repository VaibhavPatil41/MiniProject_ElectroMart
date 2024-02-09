
delimiter //
create procedure add_balance_amount(in amount float,in mid int)
begin 
update wallet 
set balance_amount=balance_amount+ amount
where user_id=mid;
end //
delimiter ;

--

DELIMITER //

CREATE PROCEDURE searchRange(IN minprice INT, IN maxprice INT)
BEGIN
SELECT * FROM products
WHERE product_price BETWEEN minprice AND maxprice;
END //

DELIMITER ;

--

delimiter //
create procedure add_to_cart(in cust_id int, qty int,p_id int)
begin
Insert into cart (customer_id, quantity, products_id) value (cust_id, qty, p_id);
end //
delimiter ;

--
DELIMITER //

CREATE PROCEDURE GiveFeedbackToVendor(
    IN p_rating INT,
    IN p_description VARCHAR(255),
    IN p_customer_id INT
)
BEGIN
    -- Insert feedback into the feedback table
    INSERT INTO feedback (rating, description, customer_id)
    VALUES (p_vendor_id, p_rating, p_description, p_customer_id);

END //

DELIMITER ;