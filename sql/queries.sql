-- 1) Actor que aparece más veces cosiderando la plataforma de netflix
SELECT a.name, COUNT(a.name) as total_times
FROM actor a
INNER JOIN show_actor sa
ON a.id_actor=sa.id_actor
INNER JOIN `show` s
ON sa.id_show=s.id_show
INNER JOIN show_platform sp
ON s.id_show=sp.id_show
INNER JOIN platform p
ON sp.id_platform=p.id_platform
WHERE p.name='netflix'
GROUP BY a.name
ORDER BY total_times DESC
LIMIT 1;

-- 2) Top 10 de actores considerando ambas plataformas en el año actual
SELECT a.name, COUNT(a.name) as total_times
FROM `show` s
INNER JOIN show_actor sa
ON s.id_show=sa.id_show
INNER JOIN actor a
ON sa.id_actor=a.id_actor
WHERE YEAR(s.date_added)=YEAR(CURRENT_DATE())
GROUP BY a.name
ORDER BY total_times DESC
LIMIT 10;

-- 3) Procedimiento almacenado que toma como parámetro un año y devuelve top 5 de películas con mayor duración
CREATE PROCEDURE top5_movies (year_selected SMALLINT)

SELECT s.title, s.duration
FROM `show` s
INNER JOIN show_type st
ON s.id_show=st.id_show
INNER JOIN `type` t
ON st.id_type=t.id_type
WHERE s.release_year=year_selected AND 
	  t.name='movie'
LIMIT 5;
