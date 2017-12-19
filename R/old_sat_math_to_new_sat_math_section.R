#' Recode old SAT math section to new SAT math section (200-800 scale)
#'
#' Function to recode old SAT math section to new SAT math section
#' (200-800 scale). Missing and unmatched values are coded as missing.
#'
#' @param x numeric vector of old SAT math section values
#' @return integer vector of new SAT math section values (200-800 scale)
#' @examples
#' require(dplyr)
#'
#' old_sat_vals <- round(sample(200:800, 10), -1)
#' new_sat_vals <- old_sat_math_to_new_sat_math_section(old_sat_vals)
#' old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
#' print(old_new_vals)
#'
#' old_new_vals %>%
#'     mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_section(old_sat_vals))
#' @export
old_sat_math_to_new_sat_math_section <- function(x){
  dplyr::recode(x,
                `200` = 200L,
                `210` = 220L,
                `220` = 230L,
                `230` = 250L,
                `240` = 260L,
                `250` = 280L,
                `260` = 300L,
                `270` = 310L,
                `280` = 330L,
                `290` = 340L,
                `300` = 350L,
                `310` = 360L,
                `320` = 360L,
                `330` = 370L,
                `340` = 380L,
                `350` = 390L,
                `360` = 400L,
                `370` = 410L,
                `380` = 420L,
                `390` = 430L,
                `400` = 440L,
                `410` = 450L,
                `420` = 460L,
                `430` = 470L,
                `440` = 480L,
                `450` = 490L,
                `460` = 500L,
                `470` = 510L,
                `480` = 510L,
                `490` = 520L,
                `500` = 530L,
                `510` = 540L,
                `520` = 550L,
                `530` = 560L,
                `540` = 570L,
                `550` = 570L,
                `560` = 580L,
                `570` = 590L,
                `580` = 600L,
                `590` = 610L,
                `600` = 620L,
                `610` = 630L,
                `620` = 640L,
                `630` = 650L,
                `640` = 660L,
                `650` = 670L,
                `660` = 690L,
                `670` = 700L,
                `680` = 710L,
                `690` = 720L,
                `700` = 730L,
                `710` = 740L,
                `720` = 750L,
                `730` = 760L,
                `740` = 760L,
                `750` = 770L,
                `760` = 780L,
                `770` = 780L,
                `780` = 790L,
                `790` = 800L,
                `800` = 800L,
                .default = NA_integer_)

}
