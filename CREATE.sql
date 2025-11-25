CREATE TABLE Genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Singers (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(255) NOT NULL
);

CREATE TABLE SingersGenres (
	singer_id INT REFERENCES Singers(singer_id) ON DELETE CASCADE,
	genre_id INT REFERENCES Genres(genre_id) ON DELETE CASCADE,
	CONSTRAINT s_g_pk PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(255) NOT NULL,
	release_year INT NOT NULL
);

CREATE TABLE AlbumsSingers (
	album_id INT REFERENCES Albums(album_id) ON DELETE CASCADE,
	singer_id INT REFERENCES Singers(singer_id) ON DELETE CASCADE,
	CONSTRAINT a_s_pk PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE Tracks (
	track_id SERIAL PRIMARY KEY,
	album_id INT REFERENCES Albums(album_id) ON DELETE CASCADE,
	track_name VARCHAR(255) NOT NULL,
	track_length INTEGER CHECK (track_length > 0) 
);

CREATE TABLE Collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(255) NOT NULL,
	collection_year DATE
);

CREATE TABLE CollectionTracks (
	collection_id INT REFERENCES Collections(collection_id) ON DELETE CASCADE,
	track_id INT REFERENCES Tracks(track_id) ON DELETE CASCADE,
	CONSTRAINT c_t_pk PRIMARY KEY (collection_id, track_id)
);