#' Recode new SAT reading test to old SAT critical reading section
#'
#' Function to recode new SAT reading test to old SAT critical reading section
#'
#' @param x numeric vector of new SAT reading test values
#' @return integer vector of old SAT critical reading section values
#' @export
new_sat_reading_to_old_sat_reading <- function(x){
  require(dplyr)
  dplyr::recode(x,
                `10` = 200L,
                `11` = 210L,
                `12` = 220L,
                `13` = 240L,
                `14` = 250L,
                `15` = 260L,
                `16` = 270L,
                `17` = 280L,
                `18` = 310L,
                `19` = 340L,
                `20` = 370L,
                `21` = 380L,
                `22` = 400L,
                `23` = 420L,
                `24` = 440L,
                `25` = 460L,
                `26` = 480L,
                `27` = 500L,
                `28` = 520L,
                `29` = 530L,
                `30` = 550L,
                `31` = 570L,
                `32` = 590L,
                `33` = 610L,
                `34` = 640L,
                `35` = 660L,
                `36` = 680L,
                `37` = 700L,
                `38` = 720L,
                `39` = 760L,
                `40` = 790L)
}
