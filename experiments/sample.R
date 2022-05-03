
pts <- readRDS("./experiments/samplepts.rds")

library(dplyr)
library(magrittr)

pts <- data.frame(Lat = c(41.1578110483, 41.15374),
                  Lon = c(-73.8716163883, -73.87098),
                  Alt = c(-29.3619984455, -28.664)) %>%
  mutate(url = vdatum_url(x = Lon, y = Lat, z = Alt,
                          s_v_frame='NAD83_2011',
                          s_v_geoid='geoid12b',
                          t_coor='spc',
                          t_h_unit='us_ft',
                          t_h_zone='3101',
                          t_v_frame='NAVD88',
                          t_v_unit='us_ft',
                          t_v_geoid='geoid12b',
                          epoch_in='2022',
                          epoch_out='2022'))

t_pts <- vdatum_convert(pts, url)




