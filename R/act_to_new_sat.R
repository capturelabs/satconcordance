#' Recode ACT to new SAT (1600 scale)
#'
#' Function to recode ACT to new SAT (1600 scale)
#'
#' @param x numeric vector of ACT values
#' @return integer vector of new SAT values (1600 scale)
#' @examples
#' require(dplyr)
#'
#' act_vals <- sample(11:36, 10)
#' new_sat_vals <- act_to_new_sat(act_vals)
#' act_new_vals <- data.frame(act_vals, new_sat_vals)
#' print(act_new_vals)
#'
#' act_new_vals %>%
#'     mutate(new_sat_vals_piped = act_to_new_sat(act_vals))
#' @export
act_to_new_sat <- function(x){
  dplyr::recode(x,
                `36` = 1600L,
                `35` = 1570L,
                `34` = 1540L,
                `33` = 1500L,
                `32` = 1470L,
                `31` = 1430L,
                `30` = 1400L,
                `29` = 1360L,
                `28` = 1320L,
                `27` = 1290L,
                `26` = 1260L,
                `25` = 1220L,
                `24` = 1180L,
                `23` = 1140L,
                `22` = 1110L,
                `21` = 1070L,
                `20` = 1030L,
                `19` = 990L,
                `18` = 950L,
                `17` = 910L,
                `16` = 870L,
                `15` = 830L,
                `14` = 780L,
                `13` = 740L,
                `12` = 680L,
                `11` = 590L,
                .default = NA_integer_)
}
