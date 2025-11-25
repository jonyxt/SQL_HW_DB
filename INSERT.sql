INSERT INTO genres (genre_name)
VALUES ('Rock'), ('Pop'), ('Jazz');

INSERT INTO singers (singer_name)
VALUES ('Alice Cooper'), ('Michael Jackson'), ('Norah Jones'), ('Freddie Mercury'), ('Sting');

INSERT INTO singersgenres (singer_id, genre_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 1), (4, 2), (5, 2);

INSERT INTO albums (album_name, release_year)
VALUES ('School''s Out', 1972), ('Thriller', 1982), ('Come Away With Me', 2002), ('My Stories', 2021), ('Desert Myths', 2019), ('Mr. Fahrenheit', 1985); 

INSERT INTO albumssingers (album_id, singer_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 5), (5, 5), (6, 4);

INSERT INTO tracks (album_id, track_name, track_length)
VALUES (1, 'School''s Out (Track)', 210), (1, 'Luney Tune', 190), 
		(2, 'Thriller (Track)', 360), (2, 'Beat It', 258), 
		(3, 'Don''t Know Why', 185), (3, 'Seven Years', 200), 
		(4, 'My Love Is Real', 240), (4, 'My Shadow', 230),
		(5, 'My Desert Sun', 250), (5, 'Night Mirage', 230),
		(6, 'I''m Burning Up', 215);

INSERT INTO collections (collection_name, collection_year)
VALUES ('Best Rock Classics', '2010-01-01'), ('Pop Legends', '2015-01-01'), ('Jazz Vibes', '2020-01-01'), ('All-Time Hits', '2022-01-01');

INSERT INTO collectiontracks (collection_id, track_id)
VALUES (1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6), (4, 1), (4, 4), (4, 5);
