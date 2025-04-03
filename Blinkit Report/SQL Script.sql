CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `test_db`.`blinkit_database` AS
    SELECT 
        `test_db`.`orders`.`order_id` AS `order_id`,
        `test_db`.`customer`.`customer_id` AS `customer_id`,
        `test_db`.`orders`.`delivery_partner_id` AS `delivery_partner_id`,
        `test_db`.`order_item`.`product_id` AS `product_id`,
        `test_db`.`customer_feedbacks`.`feedback_id` AS `feedback_id`,
        `test_db`.`orders`.`order_date` AS `order_datetime`,
        `test_db`.`customer`.`area` AS `area`,
        `test_db`.`customer`.`customer_name` AS `customer_name`,
        `test_db`.`customer`.`customer_segment` AS `customer_segment`,
        `test_db`.`products`.`product_name` AS `product_name`,
        `test_db`.`products`.`category` AS `category`,
        `test_db`.`products`.`price` AS `price`,
        `test_db`.`order_item`.`quantity` AS `Quantity`,
        ROUND((`test_db`.`products`.`price` * `test_db`.`order_item`.`quantity`),
                2) AS `Value`,
        `test_db`.`orders`.`payment_method` AS `payment_method`,
        `test_db`.`delivery`.`promised_time` AS `promised_time`,
        `test_db`.`delivery`.`actual_time` AS `actual_time`,
        `test_db`.`delivery`.`delivery_time_minutes` AS `delivery_time_minutes`,
        `test_db`.`delivery`.`reasons_if_delayed` AS `reasons_if_delayed`,
        `test_db`.`customer_feedbacks`.`rating` AS `rating`,
        `test_db`.`customer_feedbacks`.`feedback_category` AS `feedback_category`,
        `test_db`.`customer_feedbacks`.`feedback_text` AS `feedback_text`,
        `test_db`.`customer_feedbacks`.`sentiment` AS `feedback_segment`,
        `test_db`.`rating`.`Emoji` AS `Emoji`,
        `test_db`.`rating`.`Star` AS `star`,
        `test_db`.`category`.`Img` AS `img`,
        CAST(`test_db`.`orders`.`order_date` AS DATE) AS `Date`
    FROM
        (((((((`test_db`.`orders`
        JOIN `test_db`.`customer`)
        JOIN `test_db`.`order_item`)
        JOIN `test_db`.`products`)
        JOIN `test_db`.`customer_feedbacks`)
        JOIN `test_db`.`delivery`)
        JOIN `test_db`.`rating`)
        JOIN `test_db`.`category`)
    WHERE
        ((`test_db`.`orders`.`customer_id` = `test_db`.`customer`.`customer_id`)
            AND (ROUND(`test_db`.`order_item`.`order_id`, 0) = `test_db`.`orders`.`order_id`)
            AND (`test_db`.`order_item`.`product_id` = ROUND(`test_db`.`products`.`product_id`, 0))
            AND (`test_db`.`customer_feedbacks`.`customer_id` = `test_db`.`orders`.`customer_id`)
            AND (`test_db`.`customer_feedbacks`.`order_id` = `test_db`.`orders`.`order_id`)
            AND (`test_db`.`delivery`.`delivery_partner_id` = `test_db`.`orders`.`delivery_partner_id`)
            AND (`test_db`.`delivery`.`order_id` = `test_db`.`orders`.`order_id`)
            AND (`test_db`.`customer_feedbacks`.`rating` = `test_db`.`rating`.`Rating`)
            AND (`test_db`.`products`.`category` = `test_db`.`category`.`category`))