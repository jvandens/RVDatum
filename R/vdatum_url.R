#' Create a URL for NOAA VDatum API
#'
#' @param x the column of the x coordinate (required)
#' @param y the column of the y coordinate (required)
#' @param z the column of the z coordinate
#' @param region
#' @param s_h_frame
#' @param s_coor
#' @param s_h_unit
#' @param s_h_zone
#' @param s_v_frame
#' @param s_v_unit
#' @param s_v_elevation
#' @param s_v_geoid
#' @param t_h_frame
#' @param t_coor
#' @param t_h_unit
#' @param t_h_zone
#' @param t_v_frame
#' @param t_v_unit
#' @param t_v_elevation
#' @param t_v_geoid
#' @param epoch_in
#' @param epoch_out
#' @param endpoint
#'
#' @return a string of the url to call
#' @export
#'
#' @examples
vdatum_url <- function(x, y, z = 0,
                       region         ='contiguous',
                       s_h_frame      ='NAD83_2011',
                       s_coor         ='geo',
                       s_h_unit       ='m',
                       s_h_zone       = NULL,
                       s_v_frame      ='NAVD88',
                       s_v_unit       ='m',
                       s_v_elevation  ='height',
                       s_v_geoid      ='geoid18',
                       t_h_frame      ='NAD83_2011',
                       t_coor         ='geo',
                       t_h_unit       ='m',
                       t_h_zone       = NULL,
                       t_v_frame      ='NAVD88',
                       t_v_unit       ='m',
                       t_v_elevation  ='height',
                       t_v_geoid      ='geoid18',
                       epoch_in       ='0.0',
                       epoch_out      ='0.0',
                       endpoint       = 'https://vdatum.noaa.gov/vdatumweb/api/convert'
)
{
  baseurl <- paste0(endpoint,"?")

  s_x            = paste0('s_x=', x)
  s_y            = paste0('s_y=', y)
  s_z            = paste0('s_z=', z)
  region         = paste0('region=', region)
  s_h_frame      = paste0('s_h_frame=', s_h_frame)
  s_coor         = paste0('s_coor=', s_coor)
  s_h_unit       = paste0('s_h_unit=', s_h_unit)
  s_h_zone       = paste0('s_h_zone=',s_h_zone)
  s_v_frame      = paste0('s_v_frame=',s_v_frame)
  s_v_unit       = paste0('s_v_unit=',s_v_unit)
  s_v_elevation  = paste0('s_v_elevation=',s_v_elevation)
  s_v_geoid      = paste0('s_v_geoid=',s_v_geoid)
  t_h_frame      = paste0('t_h_frame=',t_h_frame)
  t_coor         = paste0('t_coor=',t_coor)
  t_h_unit       = paste0('t_h_unit=',t_h_unit)
  t_h_zone       = paste0('t_h_zone=',t_h_zone)
  t_v_frame      = paste0('t_v_frame=',t_v_frame)
  t_v_unit       = paste0('t_v_unit=',t_v_unit)
  t_v_elevation  = paste0('t_v_elevation=',t_v_elevation)
  t_v_geoid      = paste0('t_v_geoid=',t_v_geoid)
  epoch_in       = paste0('epoch_in=',epoch_in)
  epoch_out      = paste0('epoch_out=',epoch_out)

  # Build the url ###############
  url <- paste(baseurl
               ,s_x
               ,s_y
               ,s_z
               ,region
               ,s_h_frame
               ,s_coor
               ,s_h_unit
               ,s_v_frame
               ,s_v_unit
               ,s_v_elevation
               ,s_v_geoid
               ,t_h_frame
               ,t_coor
               ,t_h_unit
               ,t_h_zone
               ,t_v_frame
               ,t_v_unit
               ,t_v_elevation
               ,t_v_geoid
               ,epoch_in
               ,epoch_out,
               sep = "&")

  return(url)

}
