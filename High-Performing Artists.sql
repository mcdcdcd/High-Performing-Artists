
WITH ArtistTrackMilliseconds AS (
    SELECT
        a.Name AS ArtistName, 
        alb.Title AS Title_Album,
        SUM(t.Milliseconds) AS TotalMilliseconds
    FROM
        Artist a
    JOIN
        Album alb ON a.ArtistId = alb.ArtistId
    JOIN
        Track t ON alb.AlbumId = t.AlbumId
    GROUP BY
        a.Name, alb.Title
),
AverageMilliseconds AS (
    SELECT
        AVG(TotalMilliseconds) AS AverageMillis
    FROM
        ArtistTrackMilliseconds
)
SELECT
    atm.ArtistName,
    atm.TotalMilliseconds,
    atm.Title_Album
FROM
    ArtistTrackMilliseconds atm, AverageMilliseconds av 
WHERE 
    atm.TotalMilliseconds > av.AverageMillis 
ORDER BY 
    atm.TotalMilliseconds DESC;








