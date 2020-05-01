library(tidyverse)
activities <- read_csv("data/activities.csv")
strava_activities <- activities %>%
  select(Activity.ID, Activity.Date, Activity.Name,
         Activity.Type, Elapsed.Time, Distance,
         Elapsed.Time.1, Moving.Time,
         Distance.1, Average.Speed, Elevation.Gain,
         Elevation.Loss, Elevation.Low, Elevation.High, 
         Max.Grade, Average.Grade, Apparent.Temperature)
strava_summary <- strava_activities %>%
  select(Activity.ID, Activity.Date, Distance, Moving.Time,
         Distance.1, Average.Speed, Elevation.Gain, Elevation.Loss) %>%
  rename(id = Activity.ID, distance_km = Distance,
         time_s = Moving.Time, distance_m = Distance.1)
save(strava_activities, file = "rda/strava_activities.rda")
save(strava_summary, file = "rda/strava_summary.rda")