#' Recode new SAT math section to old SAT math section
#'
#' Function to recode new SAT math section to old SAT math section
#'
#' @param x numeric vector of new SAT math section values
#' @return integer vector of old SAT math section values
#' @examples
#' require(dplyr)
#'
#' new_sat_vals <- round(sample(200:800, 10), -1)
#' old_sat_vals <- new_sat_math_to_old_sat_math(new_sat_vals)
#' new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
#' print(new_old_vals)
#'
#' new_old_vals %>%
#'     mutate(old_sat_vals_piped = new_sat_math_to_old_sat_math(new_sat_vals))
#' @export
new_sat_math_to_old_sat_math <- function(x){
  dplyr::recode(x,
                `200` = 200L,
                `210` = 200L,
                `220` = 210L,
                `230` = 220L,
                `240` = 220L,
                `250` = 230L,
                `260` = 240L,
                `270` = 240L,
                `280` = 250L,
                `290` = 260L,
                `300` = 260L,
                `310` = 270L,
                `320` = 280L,
                `330` = 280L,
                `340` = 290L,
                `350` = 300L,
                `360` = 310L,
                `370` = 330L,
                `380` = 340L,
                `390` = 350L,
                `400` = 360L,
                `410` = 370L,
                `420` = 380L,
                `430` = 390L,
                `440` = 400L,
                `450` = 410L,
                `460` = 420L,
                `470` = 430L,
                `480` = 440L,
                `490` = 450L,
                `500` = 460L,
                `510` = 470L,
                `520` = 490L,
                `530` = 500L,
                `540` = 510L,
                `550` = 520L,
                `560` = 530L,
                `570` = 550L,
                `580` = 560L,
                `590` = 570L,
                `600` = 580L,
                `610` = 590L,
                `620` = 600L,
                `630` = 610L,
                `640` = 620L,
                `650` = 630L,
                `660` = 640L,
                `670` = 650L,
                `680` = 650L,
                `690` = 660L,
                `700` = 670L,
                `710` = 680L,
                `720` = 690L,
                `730` = 700L,
                `740` = 710L,
                `750` = 720L,
                `760` = 740L,
                `770` = 750L,
                `780` = 760L,
                `790` = 780L,
                `800` = 800L)
}
