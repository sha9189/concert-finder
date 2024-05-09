WITH all_1 as (
SELECT * FROM
event 
FULL OUTER JOIN event_artist_bridge USING (event_id)
FULL OUTER JOIN artist USING (artist_id)
FULL OUTER JOIN event_genre_bridge USING (event_id)
FULL OUTER JOIN genre USING (genre_id)
FULL OUTER JOIN event_venue_bridge USING (event_id)
FULL OUTER JOIN venue USING (venue_id)
FULL OUTER JOIN venue_state_bridge USING (venue_id)
FULL OUTER JOIN state USING (state_code) 
ORDER BY state_name DESC
), 
all_2 as (
SELECT * FROM
event 
FULL OUTER JOIN event_artist_bridge USING (event_id)
FULL OUTER JOIN artist USING (artist_id)
FULL OUTER JOIN event_genre_bridge USING (event_id)
FULL OUTER JOIN genre USING (genre_id)
FULL OUTER JOIN event_venue_bridge USING (event_id)
FULL OUTER JOIN venue USING (venue_id)
FULL OUTER JOIN venue_state_bridge USING (venue_id)
FULL OUTER JOIN state USING (state_code) 
ORDER BY genre DESC
), 
artist_info as (
SELECT * FROM all_1 
	WHERE artist_name = 'Aerosmith'
)
SELECT * FROM all_2, artist_info where all_2.Event_Start_Date >= '2024-01-01' 
and all_2.artist_name = 'Melanie Martinez';


DROP INDEX if exists idx_artist_name;
CREATE INDEX idx_artist_name 
ON artist(artist_name);

DROP INDEX if exists idx_genre;
CREATE INDEX idx_genre 
ON genre(genre_name);

DROP INDEX if exists idx_state_name;
CREATE INDEX idx_state_name 
ON state(state_name);

DROP INDEX if exists idx_event_start_date;
CREATE INDEX idx_event_start_date 
ON Event (Event_Start_Date);


DROP INDEX if exists idx_artist_name;
DROP INDEX if exists idx_genre;
DROP INDEX if exists idx_state_name;
DROP INDEX if exists idx_event_start_date;


-- SELECT * FROM Event WHERE Event_Start_Date >= '2024-01-01';
-- -- Create Index
-- CREATE INDEX idx_event_start_date ON Event (Event_Start_Date);
-- DROP INDEX idx_event_start_date;
-- -- Execute Query
-- SELECT * FROM Event WHERE Event_Start_Date >= '2024-01-01';

