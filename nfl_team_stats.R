#NFL team stats

# Section 0: Libraries ----
library(dplyr)
library(ggplot2)
library(ggthemes)
library(rvest)
library(lubridate)
library(knitr)
library(rmarkdown)

#
#
#

# Section 1: OFFENSE ----

#scrape offense data using rvest package
url.offense.2015 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2015&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2014 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2014&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2013 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2013&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2012 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2012&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2011 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2011&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2010 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2010&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2009 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2009&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2008 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2008&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2007 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2007&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2006 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2006&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"
url.offense.2005 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2005&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1"

#builds data frames from tables
offense.2015 <- as.data.frame(url.offense.2015 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2014 <- as.data.frame(url.offense.2014 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2013 <- as.data.frame(url.offense.2013 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2012 <- as.data.frame(url.offense.2012 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2011 <- as.data.frame(url.offense.2011 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2010 <- as.data.frame(url.offense.2010 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2009 <- as.data.frame(url.offense.2009 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2008 <- as.data.frame(url.offense.2008 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2007 <- as.data.frame(url.offense.2007 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2006 <- as.data.frame(url.offense.2006 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
offense.2005 <- as.data.frame(url.offense.2005 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())

#adds year column to each dataframe
offense.2015$year <- "2015"
offense.2014$year <- "2014"
offense.2013$year <- "2013"
offense.2012$year <- "2012"
offense.2011$year <- "2011"
offense.2010$year <- "2010"
offense.2009$year <- "2009"
offense.2008$year <- "2008"
offense.2007$year <- "2007"
offense.2006$year <- "2006"
offense.2005$year <- "2005"

#combines and formats offensive data frames
offense <- rbind(offense.2015, offense.2014, offense.2013, offense.2012, offense.2011, offense.2010, offense.2009,
                 offense.2008, offense.2007, offense.2006, offense.2005)
names(offense) <- tolower(names(offense))
names(offense)[1] <- "rank"
names(offense)[3] <- "games"
names(offense)[4] <- "pts.game"
names(offense)[5] <- "tot.pts"
names(offense)[9] <- "firstdowns.game"
names(offense)[10] <- "conv.third"
names(offense)[11] <- "att.third"
names(offense)[12] <- "third.rate"
names(offense)[13] <- "conv.fourth"
names(offense)[14] <- "att.fourth"
names(offense)[15] <- "fourth.rate"
names(offense)[18] <- "timepos.game"
names(offense)[21] <- "turnovers"

offense$rank <- as.factor(offense$rank)
offense$team <- as.factor(offense$team)
offense$year <- as.factor(offense$year)

#adds PHI flag, useful for colors when plotting
offense$flag <- "Other"
offense$flag[offense$team == "Philadelphia Eagles"] <- "PHI"
offense$flag <- as.factor(offense$flag)

#removes comma separator and formats as.numeric
offense$scrm.plys <- as.numeric(gsub(',', '', offense$scrm.plys))
offense$pen.yds <- as.numeric(gsub(',', '', offense$pen.yds))

#formats time of possession using lubridate package 
offense$timepos.game <- ms(offense$timepos.game)

#removes rank vector
offense$rank <- NULL

#checks structure
str(offense)

#
#
#

# Section 2: DEFENSE ----

#scrape offense data using rvest package
url.defense.2015 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2015&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2014 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2014&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2013 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2013&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2012 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2012&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2011 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2011&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2010 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2010&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2009 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2009&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2008 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2008&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2007 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2007&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2006 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2006&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
url.defense.2005 <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=GAME_STATS&conference=ALL&role=OPP&season=2005&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"

#builds data frames from tables
defense.2015 <- as.data.frame(url.defense.2015 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2014 <- as.data.frame(url.defense.2014 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2013 <- as.data.frame(url.defense.2013 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2012 <- as.data.frame(url.defense.2012 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2011 <- as.data.frame(url.defense.2011 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2010 <- as.data.frame(url.defense.2010 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2009 <- as.data.frame(url.defense.2009 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2008 <- as.data.frame(url.defense.2008 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2007 <- as.data.frame(url.defense.2007 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2006 <- as.data.frame(url.defense.2006 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())
defense.2005 <- as.data.frame(url.defense.2005 %>% html() %>% html_nodes(xpath = '//*[@id="result"]') %>% html_table())

#adds year column to each dataframe
defense.2015$year <- "2015"
defense.2014$year <- "2014"
defense.2013$year <- "2013"
defense.2012$year <- "2012"
defense.2011$year <- "2011"
defense.2010$year <- "2010"
defense.2009$year <- "2009"
defense.2008$year <- "2008"
defense.2007$year <- "2007"
defense.2006$year <- "2006"
defense.2005$year <- "2005"

#combines and formats offensive data frames
defense <- rbind(defense.2015, defense.2014, defense.2013, defense.2012, defense.2011, defense.2010, defense.2009,
                 defense.2008, defense.2007, defense.2006, defense.2005)

names(defense) <- tolower(names(defense))
names(defense)[3] <- "def.games"
names(defense)[4] <- "pts.game.allowed"
names(defense)[5] <- "tot.pts.allowed"
names(defense)[6] <- "def.scrm.plys"
names(defense)[7] <- "def.yds.g"
names(defense)[8] <- "def.yds.p"
names(defense)[9] <- "firstdowns.game.allowed"
names(defense)[10] <- "conv.third.allowed"
names(defense)[11] <- "att.third.allowed"
names(defense)[12] <- "third.rate.allowed"
names(defense)[13] <- "conv.fourth.allowed"
names(defense)[14] <- "att.fourth.allowed"
names(defense)[15] <- "fourth.rate.allowed"
names(defense)[16] <- "def.pen"
names(defense)[17] <- "def.pen.yds"
names(defense)[18] <- "time.on.field"
names(defense)[19] <- "def.fum"
names(defense)[20] <- "def.fum.lost"

defense$team <- as.factor(defense$team)
defense$year <- as.factor(defense$year)

#removes comma separator and formats as.numeric
defense$def.scrm.plys <- as.numeric(gsub(',', '', defense$def.scrm.plys))
defense$def.pen.yds <- as.numeric(gsub(',', '', defense$def.pen.yds))

#formats time of possession using lubridate package 
defense$time.on.field <- ms(defense$time.on.field)

#removes rank vector - dont need it
defense$rk <- NULL


#checks structure
str(defense)

#
#
#

#merges offense and defense data
stats <- left_join(offense, defense, by = c("team", "year"))
View(stats)

#
#
#

# Section 3: Stuff for R Markdown doc ----

#table of avg points per game by team for 2005-2015
team.pts <- stats %>% group_by(team) %>% summarise(mean.points = mean(pts.game)) %>% ungroup() %>% 
  arrange(desc(mean.points))
names(team.pts)[1] <- "Team"
names(team.pts)[2] <- "Avg. Points per Game: (2005-2015)"

#table of avg points per game by team for 2015
team.pts.2015 <- stats %>% filter(year == "2015") %>% group_by(team) %>% 
  summarise(mean.points = mean(pts.game)) %>% ungroup() %>% arrange(desc(mean.points))

#plots

(pts.vs.pen <- ggplot(subset(stats, year == "2015"), aes(x=pen.yds, y=pts.game)) + 
  geom_point(size=3, alpha=.6) + labs(x="\nPenalty Yards", y="Points per Game\n", 
                                      title = "Points per Game vs. Penalty Yards\n(2015)\n"))

(thirdconv.vs.pen <- ggplot(subset(stats, year == "2015"), aes(x=pen.yds, y=third.rate)) + 
  geom_point(size=3, alpha=.6) + labs(x="\nPenalty Yards", y="3rd Down COnversion Rate\n", 
                                      title = "Points per Game vs. Penalty Yards\n(2015)\n"))

