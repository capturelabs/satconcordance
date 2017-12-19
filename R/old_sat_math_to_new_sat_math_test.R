#' Recode old SAT math section to new SAT math test (10-40 scale)
#'
#' Function to recode old SAT math section to new SAT math test (10-40 scale).
#' Missing and unmatched values are coded as missing.
#'
#' @param x numeric vector of old SAT math section values
#' @return integer vector of new SAT math test values (10-40 scale)
#' @examples
#' require(dplyr)
#'
#' old_sat_vals <- round(sample(200:800, 10), -1)
#' new_sat_vals <- old_sat_math_to_new_sat_math_test(old_sat_vals)
#' old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
#' print(old_new_vals)
#'
#' old_new_vals %>%
#'     mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_test(old_sat_vals))
#' @export
old_sat_math_to_new_sat_math_test <- function(x){
  dplyr::recode(x,
                `200` = 10,
                `210` = 11,
                `220` = 11.5,
                `230` = 12.5,
                `240` = 13,
                `250` = 14,
                `260` = 15,
                `270` = 15.5,
                `280` = 16.5,
                `290` = 17,
                `300` = 17.5,
                `310` = 18,
                `320` = 18,
                `330` = 18.5,
                `340` = 19,
                `350` = 19.5,
                `360` = 20,
                `370` = 20.5,
                `380` = 21,
                `390` = 21.5,
                `400` = 22,
                `410` = 22.5,
                `420` = 23,
                `430` = 23.5,
                `440` = 24,
                `450` = 24.5,
                `460` = 25,
                `470` = 25.5,
                `480` = 25.5,
                `490` = 26,
                `500` = 26.5,
                `510` = 27,
                `520` = 27.5,
                `530` = 28,
                `540` = 28.5,
                `550` = 28.5,
                `560` = 29,
                `570` = 29.5,
                `580` = 30,
                `590` = 30.5,
                `600` = 31,
                `610` = 31.5,
                `620` = 32,
                `630` = 32.5,
                `640` = 33,
                `650` = 33.5,
                `660` = 34.5,
                `670` = 35,
                `680` = 35.5,
                `690` = 36,
                `700` = 36.5,
                `710` = 37,
                `720` = 37.5,
                `730` = 38,
                `740` = 38,
                `750` = 38.5,
                `760` = 39,
                `770` = 39,
                `780` = 39.5,
                `790` = 40,
                `800` = 40,
                .default = NA_real_)
}
