#' Recode ACT to new SAT (1600 scale)
#'
#' Function to recode ACT to new SAT (1600 scale).
#' Missing and unmatched values are coded as missing.
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
                `36` = 1590L,
                `35` = 1540L,
                `34` = 1500L,
                `33` = 1460L,
                `32` = 1430L,
                `31` = 1400L,
                `30` = 1370L,
                `29` = 1340L,
                `28` = 1310L,
                `27` = 1280L,
                `26` = 1240L,
                `25` = 1220L,
                `24` = 1180L,
                `23` = 1140L,
                `22` = 1110L,
                `21` = 1080L,
                `20` = 1040L,
                `19` = 1010L,
                `18` = 970L,
                `17` = 930L,
                `16` = 890L,
                `15` = 850L,
                `14` = 800L,
                `13` = 760L,
                `12` = 710L,
                `11` = 670L,
                `10` = 630L,
                `9` = 590L,
                .default = NA_integer_)
}
