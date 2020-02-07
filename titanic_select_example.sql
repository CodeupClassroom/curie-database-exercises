USE titanic_db;

describe passengers;

SELECT survived, passenger_id FROM passengers;

SELECT * FROM passengers
WHERE class = 'First'
OR class = 'Third';

SELECT * FROM passengers
WHERE age > 50;

SELECT * FROM passengers
WHERE age BETWEEN 20 AND 30;
