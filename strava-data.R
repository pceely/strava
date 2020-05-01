library(tidyverse)
library(dslabs)
library(gtools)
library(lubridate)

#strava
#columns to keep
# data set name activities
# strava_act_20200428 <- activities %>%
#   select(Activity.ID, Activity.Date, Activity.Name,
#          Activity.Type, Elapsed.Time, Distance,
#          Elapsed.Time.1, Moving.Time,
#          Distance.1, Average.Speed, Elevation.Gain,
#          Elevation.Loss, Elevation.Low, Elevation.High, 
#          Max.Grade, Average.Grade, Apparent.Temperature)
# strava_summary <- strava_act_20200428 %>%
#   select(Activity.ID, Activity.Date, Distance, Moving.Time,
#          Distance.1, Average.Speed, Elevation.Gain, Elevation.Loss) %>%
#   rename(id = Activity.ID, distance_km = Distance,
#          time_s = Moving.Time, distance_m = Distance.1)
strava_summary_tmp <- strava_summary %>%
  mutate(rate_mpkm = time_s /distance_m * 1000 / 60) %>%
  mutate(date = dmy_hms(Activity.Date)) %>%
  mutate(year = year(date)) %>%
  select(-Activity.Date)
#clean up data
strava_summary_tmp <- strava_summary_tmp %>%
  filter(rate_mpkm < 7) %>%
  filter(distance_km > 1)

strava_summary_long  <- strava_summary_tmp %>% filter(distance_km > 11)
strava_summary_fast  <- strava_summary_tmp %>% filter(rate_mpkm <4.5)

#graph
strava_summary_tmp %>%
  ggplot(aes(date, rate_mpkm, color = distance_km)) +
  geom_smooth(method = "loess", span = 0.3) +
  geom_hline(yintercept = 5) +
  geom_point()

strava_summary_tmp %>%
  ggplot(aes(distance_km, rate_mpkm, color = year)) +
  geom_point()



#deal with numbers and dates

# date <- dmy_hms(strava_sum_tmp_date)
# strava_summary_tmp <- strava_summary_tmp %>%
#   mutate(year = year(dmy_hms(date)))


# strava_sum_tmp <- strava_summary_tmp[1090,]
# strava_sum_tmp_date <- strava_sum_tmp$date


#tasks:
#remove unused columns and rename - 
# calculate run rate - mins per km
# sort out the date and time
# create a year column
# convert to km and mins

