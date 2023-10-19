/*Comments on SQL*/
/*Coach*/
select player_name, sum(pf) as TotalFouls
    from game_details
    having sum(pf) > -1
    group by player_name
    order by sum(pf) desc 
	
/*Investors*/
select teams.city,ranking.team_id,teams.abbreviation,teams.nickname,round(avg(ranking.w_pct),2) as "WIN %"
from ranking,teams
where ranking.team_id=teams.team_id
group by ranking.team_id,teams.city,teams.abbreviation,teams.nickname
order by avg(ranking.w_pct) desc

/*NBA Organization*/
select distinct p.season, t.nickname, count(p.player_ID) as number_of_players 
from teams t, players p where t.team_ID = p.team_ID 
group by t.nickname, p.season 
order by p.season desc, nickname asc

/*Media-home country win*/
select t.nickname, g.season, round(sum(g.home_team_wins) / count(g.HOME_TEAM_ID), 3) win_home_PCT
from teams t, games g where t.team_ID = g.home_team_ID 
group by t.nickname, g.season order by g.season desc

/*Fans-Teams with highest FGA*/
select t.nickname,  gd.season, max(gd.fga) as "TOTAL FGA" 
from teams t, players p, game_details gd 
where t.team_ID = p.team_ID and p.team_ID = gd.team_ID and p.player_ID = gd.player_ID and p.season = gd.season  
group by gd.season, t.nickname
order by gd.season desc, max(gd.fga) desc