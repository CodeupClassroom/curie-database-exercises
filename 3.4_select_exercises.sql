USE albums_db;

DESCRIBE albums;

SELECT name as "Albums by Pink Floyd"
FROM albums
WHERE artist = "Pink Floyd";

SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre
FROM albums
where name = "Nevermind";

SELECT name, release_date, artist
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

SELECT *
FROM albums
WHERE sales < 20;

SELECT *
FROM albums
WHERE genre = "Rock";

SELECT *
FROM albums
WHERE genre LIKE '%rock%';