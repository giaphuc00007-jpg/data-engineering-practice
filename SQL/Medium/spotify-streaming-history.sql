-- Difficulty: Medium
-- Description:You're given two tables containing data on Spotify users' streaming activity: songs_history which has historical streaming data, and songs_weekly which has data from the current week.
--Write a query that outputs the user ID, song ID, and cumulative count of song plays up to August 4th, 2022, sorted in descending order.
--Assume that there may be new users or songs in the songs_weekly table that are not present in the songs_history table.
--Definitions:
--song_weeklytable only contains data for the week of August 1st to August 7th, 2022.
--songs_history table contains data up to July 31st, 2022. The query should include historical data from this table.

with dk as(
select user_id, song_id,song_plays
from songs_history
union all 
select user_id, song_id,1 as song_plays
from songs_weekly
where listen_time < '2022-08-05'
)
select user_id, song_id,sum(song_plays) as song_plays
from dk 
group by user_id, song_id
order by sum(song_plays) desc
