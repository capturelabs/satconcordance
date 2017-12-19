#' Recode old SAT critical reading test to new SAT reading section
#'
#' Function to recode old SAT critical reading test to new SAT reading section.
#' Missing and unmatched values are coded as missing.
#'
#' @param x numeric vector of old SAT critical reading test values
#' @return integer vector of new SAT reading section values
#' @examples
#' require(dplyr)
#'
#' old_sat_vals <- round(sample(200:800, 10), -1)
#' new_sat_vals <- old_sat_reading_to_new_sat_reading(old_sat_vals)
#' old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
#' print(old_new_vals)
#'
#' old_new_vals %>%
#'     mutate(new_sat_vals_piped = old_sat_reading_to_new_sat_reading(old_sat_vals))
#' @export
old_sat_reading_to_new_sat_reading <- function(x){
  dplyr::recode(x,
                `200` = 10L,
                `210` = 11L,
                `220` = 12L,
                `230` = 13L,
                `240` = 13L,
                `250` = 14L,
                `260` = 15L,
                `270` = 16L,
                `280` = 17L,
                `290` = 17L,
                `300` = 18L,
                `310` = 18L,
                `320` = 18L,
                `330` = 19L,
                `340` = 19L,
                `350` = 19L,
                `360` = 20L,
                `370` = 20L,
                `380` = 21L,
                `390` = 21L,
                `400` = 22L,
                `410` = 22L,
                `420` = 23L,
                `430` = 24L,
                `440` = 24L,
                `450` = 25L,
                `460` = 25L,
                `470` = 26L,
                `480` = 26L,
                `490` = 27L,
                `500` = 27L,
                `510` = 28L,
                `520` = 28L,
                `530` = 29L,
                `540` = 29L,
                `550` = 30L,
                `560` = 30L,
                `570` = 31L,
                `580` = 31L,
                `590` = 32L,
                `600` = 32L,
                `610` = 33L,
                `620` = 33L,
                `630` = 34L,
                `640` = 34L,
                `650` = 35L,
                `660` = 35L,
                `670` = 36L,
                `680` = 36L,
                `690` = 37L,
                `700` = 37L,
                `710` = 37L,
                `720` = 38L,
                `730` = 38L,
                `740` = 38L,
                `750` = 39L,
                `760` = 39L,
                `770` = 39L,
                `780` = 40L,
                `790` = 40L,
                `800` = 40L,
                .default = NA_integer_)
}
