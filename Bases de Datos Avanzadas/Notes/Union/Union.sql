SELECT `customers`.`id` as costumer_id,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    `customers`.`points`,
    'Milenial' as Generation
FROM `store`.`customers`
WHERE EXTRACT(YEAR from birth_date) between 1980 and 2000
UNION
SELECT `customers`.`id` as costumer_id,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    `customers`.`points`,
    'GenX' as Generation
FROM `store`.`customers`
WHERE EXTRACT(YEAR from birth_date) between 1965 and 1979
ORDER BY costumer_id;

SELECT `customers`.`id` as costumer_id,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    `customers`.`points`,
    'bronce' as Category
FROM `store`.`customers`
WHERE points < 1000
UNION
SELECT `customers`.`id` as costumer_id,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    `customers`.`points`,
    'plata' as Category
FROM `store`.`customers`
WHERE points between 1000 and 1999
UNION
SELECT `customers`.`id` as costumer_id,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    `customers`.`points`,
    'oro' as Category
FROM `store`.`customers`
WHERE points > 1999
ORDER BY costumer_id;



