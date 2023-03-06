CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY,
    title TEXT,
    year INTEGER,
    director TEXT
);

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT,
    email TEXT
);

CREATE TABLE ratings (
    rating_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    movie_id INTEGER,
    rating INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Sample data for movies table
INSERT INTO movies (movie_id, title, year, director)
VALUES
(1, 'The Shawshank Redemption', 1994, 'Frank Darabont'),
(2, 'The Godfather', 1972, 'Francis Ford Coppola'),
(3, 'The Dark Knight', 2008, 'Christopher Nolan'),
(4, '12 Angry Men', 1957, 'Sidney Lumet'),
(5, 'Schindler''s List', 1993, 'Steven Spielberg');

-- Sample data for users table
INSERT INTO users (user_id, username, email)
VALUES
(1, 'johnsmith', 'johnsmith@gmail.com'),
(2, 'janedoe', 'janedoe@yahoo.com'),
(3, 'bobross', 'bobross@hotmail.com');

-- Sample data for ratings table
INSERT INTO ratings (rating_id, user_id, movie_id, rating)
VALUES
(1, 1, 1, 5),
(2, 1, 2, 4),
(3, 2, 1, 4),
(4, 2, 4, 5),
(5, 3, 3, 5);

-- Query to get all movies
SELECT * FROM movies;

-- Query to get all users
SELECT * FROM users;

-- Query to get all ratings
SELECT * FROM ratings;

-- Query to get the average rating for a specific movie
SELECT AVG(rating) AS AVG_Rating FROM ratings WHERE movie_id = 1;

-- Query to get the highest rated movie
SELECT title, MAX(rating) FROM movies JOIN ratings ON movies.movie_id = ratings.movie_id;

-- Query to get the top-rated movies by average rating
SELECT movies.title, AVG(ratings.rating) as average_rating
FROM movies JOIN ratings ON movies.movie_id = ratings.movie_id
GROUP BY movies.title
ORDER BY average_rating DESC;
