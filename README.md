# SQL-Music-History

## ERD
https://dbdiagram.io/d/5f4d245688d052352cb57464

Instructions
Using the SQL Server Object Explorer in Visual Studio, examine the tables, columns, and foreign keys of the database.
Using the dbdiagram.io site, create an ERD for the database.
For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the references listed above is fair game.

1. Query all of the entries in the Genre table

2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords

3. Write a SELECT query that lists all the songs in the Song table and include the Artist name

4. Write a SELECT query that lists all the Artists that have a Pop Album

5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

6. Write a SELECT statement that lists the Albums with no songs

7. Using the INSERT statement, add one of your favorite artists to the Artist table.

8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

9. Using the INSERT statement, add some songs that are on that album to the Song table.

10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

Reminder: Direction of join matters. Try the following statements and see the difference in results.

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

17. Modify the previous query to also display the title of the album.
