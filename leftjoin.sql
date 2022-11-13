SELECT
    Name,
    Title
FROM
    artists
LEFT JOIN albums ON
    artists.ArtistId = albums.ArtistId
WHERE Title IS NULL   
ORDER BY Name;
