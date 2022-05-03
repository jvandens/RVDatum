# RVDatum
Wrapper around NOAA VDatum API

## Introduction

A simple wrapper around the NOAA VDatum API to do horizontal and vertical (and tidal) conversions in R.

## Installation

Install from github with `devtools`:

```{r}
devtools::install_github("jvandens/RVDatum")
```

## Usage

Basic workflow is to take a `data.frame` of coordinates, `mutate` a column for the url by passing in the VDatum arguments into `vdatum_url()`, then run `vdatum_convert()` to call the API and create new output columns with the results from VDatum.

Notes:

-  See:  https://vdatum.noaa.gov/docs/services.html#step105 for details on the argument names (not documented here)
-  At this time, the mutated column **must** be called "url".  Will be fixed at some point.

```{r}

library(RVDatum)

library(dplyr)
library(magrittr)

pts <- data.frame(Lat = c(41.1578110483, 41.15374),
                  Lon = c(-73.8716163883, -73.87098),
                  Alt = c(-29.3619984455, -28.664)) %>% 
  
  # construct the url with vdatum_url
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

# convert the points which will also cbind to the original dataframe
t_pts <- vdatum_convert(pts, url)

```

## Contact

Author:  Jaak Van den Sype
Company:  HDR Inc.
