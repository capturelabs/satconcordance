
<!-- README.md is generated from README.Rmd. Please edit that file -->
satconcordance
==============

The goal of satconcordance is to make it easy to recode a column of SAT scores into new or old, SAT or ACT scores.

Overview
--------

This package provides functions to recode SAT scores according to any table in the SAT Concordance Tables (Released 5/9/2016): this includes new SAT to old SAT values, old SAT to new SAT values, new SAT to ACT values, and ACT to new SAT values. All functions call dplyr::recode() to perform optimized recodes. Each function accepts a vector of values, recodes it, and returns the recoded vector.

Installation
------------

You can install satconcordance from github with:

``` r
# install.packages("devtools")
devtools::install_github("capturelabs/satconcordance")
```

Example
-------

This is a basic example which shows you how to recode old SAT values on a 2400 scale to new SAT values on a 1600 scale:

``` r
suppressMessages(require("satconcordance"))
suppressMessages(require("dplyr"))

# generate example vector
old_sat_vals <- round(sample(600:2400, 10), -1)

# recode old SAT values to new SAT values
new_sat_vals <- old_sat_to_new_sat_2400(old_sat_vals)

# assemble old and new SAT values in data.frame and visually compare
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
print(old_new_vals)
#>    old_sat_vals new_sat_vals
#> 1          2060         1440
#> 2          1830         1300
#> 3           980          750
#> 4          1650         1190
#> 5          1120          840
#> 6          1280          950
#> 7          1690         1210
#> 8          2400         1600
#> 9          1780         1270
#> 10         1200          890

# recode old SAT values to new SAT values in dplyr::mutate() pipeline
old_new_vals %>%
  mutate(new_sat_vals_piped = old_sat_to_new_sat_2400(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1          2060         1440               1440
#> 2          1830         1300               1300
#> 3           980          750                750
#> 4          1650         1190               1190
#> 5          1120          840                840
#> 6          1280          950                950
#> 7          1690         1210               1210
#> 8          2400         1600               1600
#> 9          1780         1270               1270
#> 10         1200          890                890
```
