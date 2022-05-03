#' Convert coordinates from VDatum URL
#'
#' @param df dataframe of input coordinates.
#' @param url url column as called from vdatum_url.  Must be named url
#'
#' @return a dataframe consisting of the original dataframe and cbind of the results returned from VDatum
#' @export
#'
#' @examples
vdatum_convert <- function(df, url) {

  get_url <- function(url) {

    res = httr::GET(url)
    l <- jsonlite::fromJSON(rawToChar(res$content))

  }

  # mutate in the url
  d <- purrr::map_dfr(df$url, get_url)
  out <- dplyr::bind_cols(df, d)

}
