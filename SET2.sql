--Questions set 2

/* Q1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
		Return your list ordered alphabetically by email starting with A */
		
select DISTINCT email, first_name, last_name
from customer
Join invoice on customer.customer_id = invoice.customer_id
Join invoice_line on invoice_line.invoice_id = invoice.invoice_id
where track_id IN(
				select track_id 
				from track
				join genre
				on cast(track.genre_id as int) = cast(genre.genre_id as int)
				where genre.name LIKE 'Rock'
				)
order by email;

/* Q2. Let's invite the artists who have written the most rock music in our dataset.
		Write a query that returns the Artist name and total track count of the top 10 rock bands */
		
select artist.name as artist_name, count(track_id) as track_count
from artist
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.album_id
where track_id IN(
				select track_id 
				from track
				join genre
				on cast(track.genre_id as int) = cast(genre.genre_id as int)
				where genre.name LIKE 'Rock'
				)
group by artist.name
order by track_count desc


/* Q3. Return all the track names that have a song length longer than the average song length.
		Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
		
select name, milliseconds
from track
where milliseconds >
					(
					select avg(milliseconds) as avg_length
					from track
					)
order by milliseconds desc;
