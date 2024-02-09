DELIMITER //

CREATE TRIGGER after_user_insert_Customer
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    IF (NEW.role = 'Customer') THEN
        INSERT INTO Customer(user_id)
        VALUES (NEW.id);
    END IF;
END;
//

DELIMITER ;

--

DELIMITER //

CREATE TRIGGER after_user_insert_admin
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    IF (NEW.role = 'Admin') THEN
        INSERT INTO admin (user_id)
        VALUES (NEW.id);
    END IF;
END;
//

DELIMITER ;

--

DELIMITER //

CREATE TRIGGER after_user_insert_vendor
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    IF (NEW.role = 'Vendor') THEN
        INSERT INTO vendor (user_id)
        VALUES (NEW.id);
    END IF;
END //

DELIMITER ;

--

DELIMITER //
CREATE TRIGGER generate_wallet_id
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    INSERT INTO wallet (user_id)  values(new.id);
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER after_order
AFTER INSERT
ON order FOR EACH ROW
BEGIN
  DELETE FROM cart
  WHERE cart_id = NEW.cart_id;
END //
DELIMITER ;

--

DELIMITER //

CREATE TRIGGER DeleteVendorOnLowRating
AFTER INSERT ON vendor_feedback
FOR EACH ROW
BEGIN
    DECLARE vendor_rating INT;
    SELECT rating INTO vendor_rating FROM vendor_feedback WHERE id = NEW.id;
    IF vendor_rating IS NOT NULL AND vendor_rating < 2 THEN
        DELETE FROM vendor WHERE id = NEW.vendor_id;
    END IF;
END //

DELIMITER ;