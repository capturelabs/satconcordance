#' Recode old SAT writing test to new SAT writing and language section
#'
#' Function to recode old SAT writing test to new SAT writing and language section.
#' Missing and unmatched values are coded as missing.
#'
#' @param x numeric vector of old SAT writing values
#' @return integer vector of new SAT writing and language section values
#' @examples
#' require(dplyr)
#'
#' old_sat_vals <- round(sample(200:800, 10), -1)
#' new_sat_vals <- old_sat_writing_to_new_sat_writing(old_sat_vals)
#' old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
#' print(old_new_vals)
#'
#' old_new_vals %>%
#'     mutate(new_sat_vals_piped = old_sat_writing_to_new_sat_writing(old_sat_vals))
#' @export
old_sat_writing_to_new_sat_writing <- function(x){
  dplyr::recode(x,
                `200` = 10L,
                `210` = 11L,
                `220` = 11L,
                `230` = 12L,
                `240` = 13L,
                `250` = 14L,
                `260` = 14L,
                `270` = 15L,
                `280` = 16L,
                `290` = 17L,
                `300` = 17L,
                `310` = 18L,
                `320` = 18L,
                `330` = 19L,
                `340` = 19L,
                `350` = 20L,
                `360` = 21L,
                `370` = 21L,
                `380` = 22L,
                `390` = 22L,
                `400` = 23L,
                `410` = 24L,
                `420` = 24L,
                `430` = 25L,
                `440` = 25L,
                `450` = 26L,
                `460` = 27L,
                `470` = 27L,
                `480` = 28L,
                `490` = 28L,
                `500` = 28L,
                `510` = 29L,
                `520` = 29L,
                `530` = 30L,
                `540` = 30L,
                `550` = 31L,
                `560` = 31L,
                `570` = 32L,
                `580` = 32L,
                `590` = 33L,
                `600` = 33L,
                `610` = 33L,
                `620` = 34L,
                `630` = 34L,
                `640` = 35L,
                `650` = 35L,
                `660` = 35L,
                `670` = 36L,
                `680` = 36L,
                `690` = 36L,
                `700` = 37L,
                `710` = 37L,
                `720` = 37L,
                `730` = 38L,
                `740` = 38L,
                `750` = 38L,
                `760` = 39L,
                `770` = 39L,
                `780` = 40L,
                `790` = 40L,
                `800` = 40L,
                .default = NA_integer_)
}
