source(nfl_team_stats.R)
library(knitr)
knit2html('NFL_Stats.Rmd')
View("NFL_Stats.Rmd")