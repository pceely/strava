library(tidyverse)
#read from csv from Strava
activities <- read_csv("data/activities.csv")
#initial import
strava_activities <- activities %>%
  select("Activity ID", "Activity Date", "Activity Name",
         "Activity Type", "Elapsed Time", Distance,
         "Elapsed Time", "Moving Time",
         Distance_1, "Elevation Gain",
         "Elevation Loss", "Elevation Low", "Elevation High", 
         "Max Grade", "Average Grade", "Apparent Temperature")
#select specific columns
strava_summary <- strava_activities %>%
  select("Activity ID", "Activity Date", Distance, "Moving Time",
     Distance_1, "Elevation Gain", "Elevation Loss") %>%  
  rename(id = "Activity ID", raw_date = "Activity Date",
         distance_km = Distance,
         time_s = "Moving Time", distance_m = Distance_1)
#save files in ./rda
save(strava_activities, file = "rda/strava_activities.rda")
save(strava_summary, file = "rda/strava_summary.rda")
