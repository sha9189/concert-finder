
CREATE TABLE event (
        event_id VARCHAR(255) PRIMARY KEY,
        event_name VARCHAR(255) NOT NULL,
        event_url VARCHAR(255),
        event_start_date DATE,
        event_start_time TIME,
        price_min NUMERIC,
        price_max NUMERIC,
        seatmap_url VARCHAR(255),
        age_restrictions BOOLEAN
);

CREATE TABLE artist (
    artist_id VARCHAR(255) PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
);


CREATE TABLE genre (
        genre_id VARCHAR(255) PRIMARY KEY,
        genre_name VARCHAR(255) NOT NULL,
        segment VARCHAR(255)
);

CREATE TABLE state (
   state_code VARCHAR(255) PRIMARY KEY NOT NULL,
   state_name VARCHAR(255) NOT NULL,
   country_name VARCHAR(255) NOT NULL,
   country_code VARCHAR(255) NOT NULL
);

CREATE TABLE venue (
    venue_id VARCHAR(255) PRIMARY KEY NOT NULL,
    venue_name VARCHAR(255) NOT NULL,
    venue_city VARCHAR(50),
    venue_postal_code VARCHAR(20),
    venue_lat FLOAT,
    venue_long FLOAT,
    venue_address VARCHAR(255),
    state_code VARCHAR(2), 
    FOREIGN KEY (state_code) REFERENCES state(state_code)
);


CREATE TABLE event_artist_bridge (
    id SERIAL PRIMARY KEY,
    event_id VARCHAR(255) NOT NULL,
    artist_id VARCHAR(255) NOT NULL, 
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id)
);


CREATE TABLE event_genre_bridge (
    id SERIAL PRIMARY KEY,
    event_id VARCHAR(255) NOT NULL,
    genre_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
 );


 CREATE TABLE event_venue_bridge (
    id SERIAL PRIMARY KEY,
    event_id VARCHAR(255) NOT NULL,
    venue_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
 );




CREATE TABLE venue (
    venue_id VARCHAR(255) PRIMARY KEY NOT NULL,
    venue_name VARCHAR(255) NOT NULL,
    venue_city VARCHAR(50),
    venue_postal_code VARCHAR(20),
    venue_lat FLOAT,
    venue_long FLOAT,
    venue_address VARCHAR(255)
);


CREATE TABLE state (
   state_code VARCHAR(255) PRIMARY KEY NOT NULL,
   state_name VARCHAR(255) NOT NULL,
   country_name VARCHAR(255) NOT NULL,
   country_code VARCHAR(255) NOT NULL
);



CREATE TABLE venue_state_bridge (
    id SERIAL PRIMARY KEY,
    state_code VARCHAR(2) NOT NULL,
    venue_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (state_code) REFERENCES state(state_code),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
 );
