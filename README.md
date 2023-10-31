# NBA-Team-Database
Source data: https://www.kaggle.com/nathanlauga/nba-games 

Problem going to be solve by different stakeholders
- Coaches:
Number of personal foul of each player(finding players needed to be train)
- Investors:
Competitiveness of the cities to choose where to invest
- NBA Organization:
The number of players on each team in Season
- Media:
Is there any advantage to playing an NBA game in home town?
- Fans:
“Teams with highest field goal attempts” Ranking for fun

ETL
Data quality issues & solution
- Time format is a disaster: 
Records of 1s are stored as 1min, thus 24min becomes 1h (excel format issue)
->Some become 0.375(in general format) with no obvious reason
->Thousands of data from players are missing→can not enforce foreign key (game_detail→players)
  
->Solution: 
Transform all data into a length 4 string and change to date together (change back to char when query)
Create a temp table to store the missing ID pairs and get back the player’s name, than insert back to players table


Limitations of Apex Oracles
1. Could not store all the data from the source. It only provide around 30,000 kb of storage space. We have over 600,000 data. 
Solution: Sort and remove unnecessary or extra data rows by hand
Only keep data from 2018 onwards. Data from 2003 to 2017 are removed

2. Could not be edited and opened by multiple users at the same time
Solution: Only have 1 groupmate to work on Apex Oracles at a time

Conclusions: Insights
1. Raw data needed to be well organized 
->The raw data are problematic: null value, wrong data type
	->Well organized data can made the analysis much smoother
2. Software affect comprehensiveness
Limitations of Apex Oracles → extra work for reducing data
→ less comprehensive (reduced data in database)
3. Some element can’t show in data/database
	Eg: players’ conditions in game, reputation of teams, contribution to teams
	Those element may affect winning rate or mvp which can’t be shown





