create database nba3
select * from nba_
order by player
select COUNT(player) from nba_
select distinct(pos) from nba_
select count(distinct(pos)) from nba_
select avg(years)from nba_



ALTER TABLE nba_ ADD metr FLOAT;
UPDATE nba_
SET metr = Height* 0.254;
select round(AVG(metr),1) from nba_



ALTER TABLE nba_ 
ADD weight_ FLOAT;

UPDATE nba_
SET weight_ = Wt* 0.453592;

select round(AVG(weight_),1) from nba_



select * from nba_


select max(G) from nba_

select top 1 player, g
from nba_
order by g desc;

select top 5 player, pts
from nba_
where g >=300
order by pts desc;

select top 5 player, AST
from nba_
where g >=300
order by AST desc;

select top 5 player, TRB
from nba_
where g >=300
order by TRB desc;


select top 5 player, All_Star
from nba_
where g >=300
order by All_Star desc;

select top 5 player, All_NBA
from nba_
where g >=300
order by All_nba desc;


select * from nba_



SELECT COLUMN_NAME, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'nba_'

select * from nba_

ALTER TABLE nba_
DROP COLUMN award;



ALTER TABLE nba_
ADD award INT;  

UPDATE nba_
SET award =All_Star+	All_NBA	+All_ABA+	All_Rookie+	All_Defensive+	BLK_Champ	+STL_Champ+	TRB_Champ+	AST_Champ+	Scoring_Champ+	Most_Improved+	Sixth_Man+	DPOY+	ROY+	AS_MVP+	CF_MVP+	Finals_MVP+	MVP+Championships+	NBA_75_Team	+ABA_All_Time_Team

SELECT TOP 5 player, award
FROM nba_
ORDER BY award DESC;


SELECT pos, AVG(PTS) AS AveragePoints
FROM nba_
GROUP BY Pos;

SELECT pos, AVG(ast) AS AveragePoints
FROM nba_
GROUP BY pos;

select * from nba_
order by player

SELECT
    Player,
    MAX(PTS) AS MaxPoints,
    MIN(PTS) AS MinPoints
FROM nba_
GROUP BY Player;



SELECT Player, award, 
       RANK() OVER (ORDER BY award DESC) AS Rank
FROM nba_


------------------------------------------------------------------------------------
SELECT 
    PTS,
    CASE 
        WHEN PTS < 10 THEN 'Low'
        WHEN PTS BETWEEN 10 AND 20 THEN 'Medium'
        WHEN PTS > 20 THEN 'High'
        ELSE 'Unknown'
    END AS PointsCategory
FROM 
   nba_;
   --------------------------------------------------------------------------

   --------------------------------دي تتعرفك الفرق بين سيليكت  والفرق  بين استخام whit

WITH ClassifiedPoints AS (
    SELECT player,
        PTS,
        CASE 
            WHEN PTS < 10 THEN 'Low'
            WHEN PTS BETWEEN 10 AND 20 THEN 'Medium'
            WHEN PTS > 20 THEN 'High'
            ELSE 'Unknown'
        END AS PointsCategory
    FROM 
        nba_
)
SELECT 
 player,   PTS, PointsCategory
FROM 
    ClassifiedPoints
WHERE 
    PointsCategory = 'High'
	order by pts
	--------------------------------------------اولا بتنظم عملك وسهله الاستدعاء   بدل من التكرار
	----------------------------------------------------------------------------------------------------------
	------------------لو عايز اثبت الجول في الداتا  عندي
	CREATE TABLE ClassifiedPointsTable (
    player VARCHAR(255),
    PTS INT,
    PointsCategory VARCHAR(50)
);
;WITH ClassifiedPoints AS (
    SELECT 
        player,
        PTS,
        CASE 
            WHEN PTS < 10 THEN 'Low'
            WHEN PTS BETWEEN 10 AND 20 THEN 'Medium'
            WHEN PTS > 20 THEN 'High'
            ELSE 'Unknown'
        END AS PointsCategory
    FROM 
        nba_
)
INSERT INTO ClassifiedPointsTable (player, PTS, PointsCategory)

SELECT 
    player,
    PTS,
    PointsCategory
FROM 
    ClassifiedPointsTable
WHERE 
    PointsCategory = 'High'
ORDER BY 
    PTS;
----------------------------------------------------------------

   -----------------------------           نرجع ثاني اكبر قيمه
   SELECT 
    MAX(PTS) AS SecondHighestPTS
FROM 
    nba_
WHERE 
    PTS < (SELECT MAX(PTS) FROM nba_);
	------------------------------------------------------------------
	select * from nba_
	where award>=1

	select pos ,sum(award) as n_award from nba_
	group by pos
	order   by n_award desc


	select pos ,avg (Years) as a_year from nba_
	group by pos
	order   by a_year desc

SELECT 
    ROUND((COUNT(CASE WHEN Championships > 0 THEN player END) * 100.0 / COUNT(player)), 1) AS PercentageOfPlayersWithChampionships
FROM nba_;



Select * from nba_

select pos, AVG( Height )
from nba_
group by pos;


select top 5 player, wt
from nba_
order by wt desc

select count(player)
from nba_


select distinct(pos)
from nba_


select count( distinct(pos))
from nba_

select * from nba_



select * 
from nba_
where Height > 7 and wt > 260


alter table nba_ add tarek int

update nba_
set tarek =award


                            -- تاني اكبر قيمه
   SELECT 
    MAX(PTS) 
FROM 
    nba_
WHERE 
    PTS < (SELECT MAX(PTS) FROM nba_);


select * from nba_
order by award desc
    

select player, award ,
      case 
		  when award <5 then 'low'
		  when award between 5 and 20 then 'medium'
		  when award >20 then 'high'
      end
from nba_