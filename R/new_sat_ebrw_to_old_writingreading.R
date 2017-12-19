#' Recode new SAT EBRW section to old SAT writing plus critical reading sections
#'
#' Function to recode new SAT Evidence-Based Reading and Writing Section test
#' to old SAT writing plus critical reading sections
#'
#' @param x numeric vector of new SAT EBRW section values
#' @return integer vector of old SAT writing plus critical reading section values
#' @examples
#' require(dplyr)
#'
#' new_sat_vals <- round(sample(200:800, 10), -1)
#' old_sat_vals <- new_sat_ebrw_to_old_writingreading(new_sat_vals)
#' new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
#' print(new_old_vals)
#'
#' new_old_vals %>%
#'     mutate(old_sat_vals_piped = new_sat_ebrw_to_old_writingreading(new_sat_vals))
#' @export
new_sat_ebrw_to_old_writingreading <- function(x){
  dplyr::recode(x,
                `200` = 400L,
                `210` = 410L,
                `220` = 420L,
                `230` = 430L,
                `240` = 440L,
                `250` = 440L,
                `260` = 450L,
                `270` = 460L,
                `280` = 470L,
                `290` = 480L,
                `300` = 490L,
                `310` = 500L,
                `320` = 520L,
                `330` = 550L,
                `340` = 570L,
                `350` = 600L,
                `360` = 620L,
                `370` = 640L,
                `380` = 660L,
                `390` = 690L,
                `400` = 710L,
                `410` = 730L,
                `420` = 750L,
                `430` = 770L,
                `440` = 790L,
                `450` = 800L,
                `460` = 820L,
                `470` = 840L,
                `480` = 860L,
                `490` = 880L,
                `500` = 890L,
                `510` = 910L,
                `520` = 930L,
                `530` = 950L,
                `540` = 970L,
                `550` = 990L,
                `560` = 1010L,
                `570` = 1020L,
                `580` = 1040L,
                `590` = 1060L,
                `600` = 1080L,
                `610` = 1100L,
                `620` = 1120L,
                `630` = 1150L,
                `640` = 1170L,
                `650` = 1190L,
                `660` = 1210L,
                `670` = 1240L,
                `680` = 1260L,
                `690` = 1290L,
                `700` = 1310L,
                `710` = 1340L,
                `720` = 1370L,
                `730` = 1390L,
                `740` = 1420L,
                `750` = 1450L,
                `760` = 1480L,
                `770` = 1510L,
                `780` = 1540L,
                `790` = 1560L,
                `800` = 1590L,
                .default = NA_integer_)
}
