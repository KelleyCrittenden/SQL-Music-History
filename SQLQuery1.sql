/*1. Query all of the entries in the Genre table*/
SELECT * FROM Genre

/*2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords*/
SELECT ArtistName
FROM Artist
ORDER BY ArtistName Asc;

/*3.  lists all the songs and the artist name */
SELECT s.Title,
		a.ArtistName
		FROM Song s
LEFT JOIN Artist a on s.ArtistId = a.id

/*4. All the Artist that have a Pop Album*/

SELECT art.ArtistName
FROM Artist art inner join
Album alb on art.id = alb.ArtistId
WHERE alb.GenreId = (SELECT id
					FROM Genre
					WHERE label ='Pop');

/*5. List all the Artists that have a Jazz or Rock Album*/
SELECT art.ArtistName
FROM Artist art inner join
Album alb on art.id = alb.ArtistId
WHERE alb.GenreId IN (SELECT id
					FROM Genre
					WHERE label ='Jazz' OR label ='Rock');


/*6. List all the Albums with 0 songs*/
SELECT Title
From Album
WHERE AlbumLength = null;

/*7. Use the INSERT statement, add one of your favorite artist to the artist table*/
/*INSERT INTO Artist (ArtistName, YearEstablished)
VALUES('The Shaggs', 1968);*/

/*8. Use the INSERT statement add one, or more, albums by your artist to the Album Table */
/*INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Philosophy of the World', '3/9/1969', 3139, 'Third Word', 28, 7);*/

/*9. Use the INSERT statement, add some songs that are on that album to the Song Table */
/*INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Who are Parents?', 256, '3/9/1969', 7, 28, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('The Little Sports Car', 206, '3/9/1969', 7, 28, 23);*/

/*10. Write a select query that provides the song titles, album title, and artist name for all the data you just entered in.
Use the LEFT JOIN keyword sequence to connect the tables, 
and the WHERE keyword to filter the results to the album and artist you added.
Direction of join matters. Try the following statements and see the difference in results.
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;*/

SELECT s.Title, a.Title, art.ArtistName
From Song s
LEFT JOIN Album a ON s.AlbumId = a.Id
LEFT JOIN Artist art on s.ArtistId = art.Id
WHERE art.ArtistName = 'The Shaggs';


/*11. Write a select statement to display how many songs exist for each ablum.
You'll need to use the COUNT() function and the GROUP BY keyword sequence*/
SELECT COUNT(Album.Title), Album.Title as 'NumberOfSongsOnAlbum'
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.Id
GROUP BY Album.Title;

/*12. Write a SELECT statement to display how many songs exis for each artist.
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT COUNT(Artist.ArtistName), Artist.ArtistName 
FROM Song
LEFT JOIN Artist ON Song.ArtistId = Artist.Id
GROUP BY ArtistName;

/*13. Write a SELECT statement to display how many songs exist for each genre.
You'll need to use the COUNT() function and the GROUP BY keywords sequence.*/
SELECT COUNT (Id), GenreId
FROM Song
GROUP BY GenreId;

/*14. Write a SELECT query that lists the Artists that have put out records on more than one record label.
Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword*/
SELECT Artist.ArtistName
FROM Album
LEFT JOIN Artist ON Album.ArtistId = Artist.Id
GROUP BY Artist.ArtistName
HAVING COUNT(DISTINCT Label) > 1;

/*15. Using MAX() function, write a select statement to find the album with the longest duration.
The result should display the album title and the duration.*/
SELECT Title, AlbumLength
FROM Album  
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

/*16. Using MAX() function, write a select statement to find the song with the longest duration.
The result should display the song title and the duration.*/
SELECT Title, SongLength
FROM Song
WHERE SongLength = (SELECT MAX(SongLength) FROM Song)

/*17. Modify the previous query to also display the title of the album*/
SELECT Song.Title, SongLength, Album.Title
FROM Song 
LEFT JOIN Album ON Song.AlbumId = Album.Id 
WHERE SongLength =  (SELECT MAX(SongLength) FROM Song)
