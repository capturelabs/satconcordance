#' Recode new SAT writing and language test to old SAT writing section
#'
#' Function to recode new SAT writing and language test to old SAT writing section
#'
#' @param x numeric vector of new SAT writing and language values
#' @return integer vector of old SAT writing section values
#' @examples
#' require(dplyr)
#'
#' new_sat_vals <- sample(10:40, 10)
#' old_sat_vals <- new_sat_writing_to_old_sat_writing(new_sat_vals)
#' new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
#' print(new_old_vals)
#'
#' new_old_vals %>%
#'     mutate(old_sat_vals_piped = new_sat_writing_to_old_sat_writing(new_sat_vals))
#' @export
new_sat_writing_to_old_sat_writing <- function(x){
  require(dplyr)
  dplyr::recode(x,
                `10` = 200L,
                `11` = 220L,
                `12` = 230L,
                `13` = 240L,
                `14` = 260L,
                `15` = 270L,
                `16` = 280L,
                `17` = 300L,
                `18` = 320L,
                `19` = 340L,
                `20` = 350L,
                `21` = 370L,
                `22` = 380L,
                `23` = 400L,
                `24` = 420L,
                `25` = 430L,
                `26` = 450L,
                `27` = 470L,
                `28` = 490L,
                `29` = 510L,
                `30` = 530L,
                `31` = 550L,
                `32` = 570L,
                `33` = 600L,
                `34` = 630L,
                `35` = 650L,
                `36` = 680L,
                `37` = 710L,
                `38` = 740L,
                `39` = 760L,
                `40` = 790L)
}
