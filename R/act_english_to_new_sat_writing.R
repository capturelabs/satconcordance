#' Recode ACT Enlish/Writing test to new SAT writing and language section
#'
#' Function to recode ACT Enlish/Writing test to new SAT writing and language section
#'
#' @param x numeric vector of ACT Enlish/Writing test values
#' @return integer vector of new SAT writing and language section values
#' @examples
#' require(dplyr)
#'
#' act_vals <- sample(11:36, 10)
#' new_sat_vals <- act_english_to_new_sat_writing(act_vals)
#' act_new_vals <- data.frame(act_vals, new_sat_vals)
#' print(act_new_vals)
#'
#' act_new_vals %>%
#'     mutate(new_sat_vals_piped = act_english_to_new_sat_writing(act_vals))
#' @export
act_english_to_new_sat_writing <- function(x){
  dplyr::recode(x,
                `36` = 40L,
                `35` = 40L,
                `34` = 39L,
                `33` = 38L,
                `32` = 37L,
                `31` = 36L,
                `30` = 36L,
                `29` = 35L,
                `28` = 34L,
                `27` = 33L,
                `26` = 33L,
                `25` = 32L,
                `24` = 31L,
                `23` = 30L,
                `22` = 29L,
                `21` = 28L,
                `20` = 27L,
                `19` = 26L,
                `18` = 25L,
                `17` = 24L,
                `16` = 23L,
                `15` = 22L,
                `14` = 21L,
                `13` = 19L,
                `12` = 19L,
                `11` = 18L,
                .default = NA_integer_)
}
