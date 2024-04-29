DROP TABLE IF EXISTS genre CASCADE;

CREATE TABLE genre (
        genre_id VARCHAR(255) PRIMARY KEY,
        genre_name VARCHAR(255) NOT NULL,
        segment VARCHAR(255)
);