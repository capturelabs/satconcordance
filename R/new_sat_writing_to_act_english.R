#' Recode new SAT writing and language section to ACT Enlish/Writing test
#'
#' Function to recode new SAT writing and language section to ACT Enlish/Writing test
#'
#' @param x numeric vector of new SAT writing and language section values
#' @return integer vector of ACT Enlish/Writing test values
#' @export
new_sat_writing_to_act_english <- function(x){
  require(dplyr)
  dplyr::recode(x,
                `40` = 34L,
                `39` = 33L,
                `38` = 33L,
                `37` = 32L,
                `36` = 30L,
                `35` = 29L,
                `34` = 28L,
                `33` = 26L,
                `32` = 25L,
                `31` = 24L,
                `30` = 23L,
                `29` = 22L,
                `28` = 21L,
                `27` = 20L,
                `26` = 19L,
                `25` = 18L,
                `24` = 17L,
                `23` = 16L,
                `22` = 15L,
                `21` = 14L,
                `20` = 13L,
                `19` = 13L,
                `18` = 12L,
                `17` = 11L)
}
