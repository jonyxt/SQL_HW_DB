-- 1. Название и продолжительность самого длительного трека.
SELECT track_name, track_length FROM tracks
ORDER BY track_length DESC LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name FROM tracks
WHERE track_length >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name FROM collections
WHERE collection_year BETWEEN '2018-01-01' AND '2020-12-31';

-- 4. Исполнители, чьё имя состоит из одного слова.
SELECT singer_name FROM singers
WHERE singer_name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my».
SELECT track_name FROM tracks
WHERE string_to_array(LOWER(track_name), ' ') && ARRAY['my', 'мой'];

-- 6. Количество исполнителей в каждом жанре.
SELECT g.genre_name, COUNT(sg.singer_id) AS singer_count
FROM genres g 
LEFT JOIN singersgenres sg ON g.genre_id = sg.genre_id
GROUP BY g.genre_name

-- 7. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.track_id) AS track_count
FROM tracks t 
JOIN albums a ON t.album_id = a.album_id 
WHERE a.release_year BETWEEN 2019 AND 2020

-- 8. Средняя продолжительность треков по каждому альбому.
SELECT a.album_name, AVG(t.track_length) AS avg_track_length
FROM albums a 
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.album_name

-- 9. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT s.singer_name FROM singers s 
WHERE s.singer_id NOT IN (
		SELECT singer_id FROM albumssingers asg
		JOIN albums a ON asg.album_id = a.album_id
		WHERE a.release_year = 2020
);

-- 10. Названия сборников, в которых присутствует конкретный исполнитель (id = 2).
SELECT DISTINCT c.collection_name FROM collections c 
JOIN collectiontracks ct ON c.collection_id = ct.collection_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN albumssingers asg ON a.album_id = asg.album_id
WHERE asg.singer_id = 2;

-- 11. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.album_name FROM albums a 
JOIN albumssingers als ON a.album_id = als.album_id
JOIN singersgenres sg ON als.singer_id = sg.singer_id 
GROUP BY a.album_id, a.album_name, als.singer_id 
HAVING COUNT(DISTINCT sg.genre_id ) > 1;

-- 12. Наименования треков, которые не входят в сборники.
SELECT t.track_name FROM tracks t 
LEFT JOIN collectiontracks ct ON t.track_id = ct.track_id 
WHERE ct.track_id IS NULL;

-- 13. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT DISTINCT s.singer_name FROM singers s 
JOIN albumssingers als ON s.singer_id = als.singer_id 
JOIN albums a ON als.album_id = a.album_id
JOIN tracks t ON a.album_id = t.album_id
WHERE t.track_length = (SELECT MIN(track_length) FROM tracks);

-- 14. Названия альбомов, содержащих наименьшее количество треков.
SELECT a.album_name FROM albums a 
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.album_name 
HAVING COUNT(t.track_id) = (
		SELECT COUNT(t2.track_id) FROM tracks t2 
		GROUP BY t2.album_id 
		ORDER BY COUNT(t2.track_id)
		LIMIT 1
);