DROP TRIGGER IF EXISTS after_sales_order;
DElIMITER $$
CREATE TRIGGER after_sales_order
AFTER INSERT ON orders
FOR EAACH ROW
BEGIN
    DECLARE list_id INT;
    DECLARE list_quantity INT;
    SELECT list_id, list_quantity INTO list_id, list_quantity
    FROM orders
    WHERE order_id = NEW.id;
    UPDATE lists
    SET quantity = quantity - list_quantity
    WHERE id = list_id;
END
$$
DELIMITER ;