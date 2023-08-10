DROP PROCEDURE IF EXISTS AddBonus;

DELIMITER $$
CREATE PROCEDURE AddBonus(IN p_user_id INT, IN p_bonus_name VARCHAR(255), IN p_bonus INT)
BEGIN
    DECLARE bonus_id INT;
    SELECT id INTO bonus_id
    FROM bonus
    WHERE name = p_bonus_name;
    IF bonus_id IS NULL THEN
        INSERT INTO bonus (name) VALUES (p_bonus_name);
        SET bonus_id = LAST_INSERT_ID();
    END IF;
    INSERT INTO user_bonus (user_id, bonus_id, bonus)
    VALUES (p_user_id, bonus_id, p_bonus);

    UPDATE users
    SET total_score = total_score + p_bonus
    WHERE id = p_user_id;
END
$$
DELIMITER ;