
<!-- README.md is generated from README.Rmd. Please edit that file -->
satconcordance
==============

The goal of satconcordance is to make it easy to recode a column of SAT scores into new or old, SAT or ACT scores.

Overview
--------

This package provides functions to recode SAT© scores according to any table in the SAT© Concordance Tables (Released 5/9/2016): this includes new SAT© to old SAT© values, old SAT© to new SAT© values, new SAT© to ACT© values, and ACT© to new SAT© values. All functions call dplyr::recode() to perform optimized recodes. Each function accepts a vector of values, recodes it, and returns the recoded vector. Missing and unmatched values are coded as missing.

Disclaimers
-----------

SAT® is a trademark registered by the College Board, which is not affiliated with, and does not endorse, this website or code base. ACT@ is a trademark registered by the ACT, which is not affiliated with, and does not endorse, this website or code base.

Installation
------------

You can install satconcordance from github with:

``` r
# install.packages("devtools")
devtools::install_github("capturelabs/satconcordance")
```

Usage
-----

#### Examples of recoding new scores to old scores:

``` r
suppressMessages(require("satconcordance"))
suppressMessages(require("dplyr"))

# Recode new SAT (1600 scale) to old SAT (2400 scale)
new_sat_vals <- round(sample(400:1600, 10), -1)
old_sat_vals <- new_sat_to_old_sat_2400(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
     mutate(old_sat_vals_piped = new_sat_to_old_sat_2400(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1          1530         2230               2230
#> 2          1580         2350               2350
#> 3          1330         1870               1870
#> 4           710          910                910
#> 5          1550         2280               2280
#> 6          1010         1370               1370
#> 7           950         1280               1280
#> 8          1100         1510               1510
#> 9           620          810                810
#> 10         1100         1510               1510

# Recode new SAT (1600 scale) to old SAT (1600 scale)
new_sat_vals <- round(sample(400:1600, 10), -1)
old_sat_vals <- new_sat_to_old_sat_1600(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_to_old_sat_1600(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1          1400         1340               1340
#> 2           610          540                540
#> 3           590          530                530
#> 4          1390         1330               1330
#> 5          1180         1110               1110
#> 6           730          630                630
#> 7          1470         1420               1420
#> 8          1080         1000               1000
#> 9          1590         1580               1580
#> 10         1230         1160               1160

# Recode new SAT math section to old SAT math section
new_sat_vals <- round(sample(200:800, 10), -1)
old_sat_vals <- new_sat_math_to_old_sat_math(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_math_to_old_sat_math(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1           710          680                680
#> 2           210          200                200
#> 3           480          440                440
#> 4           760          740                740
#> 5           450          410                410
#> 6           390          350                350
#> 7           400          360                360
#> 8           620          600                600
#> 9           510          470                470
#> 10          260          240                240

# Recode new SAT writing and language test to old SAT writing section
new_sat_vals <- sample(10:40, 10)
old_sat_vals <- new_sat_writing_to_old_sat_writing(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_writing_to_old_sat_writing(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1            30          530                530
#> 2            16          280                280
#> 3            28          490                490
#> 4            17          300                300
#> 5            33          600                600
#> 6            20          350                350
#> 7            21          370                370
#> 8            32          570                570
#> 9            24          420                420
#> 10           31          550                550

# Recode new SAT reading test to old SAT critical reading section
new_sat_vals <- sample(10:40, 10)
old_sat_vals <- new_sat_reading_to_old_sat_reading(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_reading_to_old_sat_reading(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1            14          250                250
#> 2            20          370                370
#> 3            33          610                610
#> 4            21          380                380
#> 5            31          570                570
#> 6            13          240                240
#> 7            16          270                270
#> 8            18          310                310
#> 9            10          200                200
#> 10           24          440                440

# Recode new SAT EBRW section to old SAT writing plus critical reading sections
new_sat_vals <- round(sample(200:800, 10), -1)
old_sat_vals <- new_sat_ebrw_to_old_writingreading(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_ebrw_to_old_writingreading(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1           270          460                460
#> 2           280          470                470
#> 3           730         1390               1390
#> 4           400          710                710
#> 5           780         1540               1540
#> 6           520          930                930
#> 7           510          910                910
#> 8           300          490                490
#> 9           370          640                640
#> 10          800         1590               1590

# Recode new SAT (1600 scale) to ACT
new_sat_vals <- round(sample(560:1600, 10), -1)
act_vals <- new_sat_to_act(new_sat_vals)
new_act_vals <- data.frame(new_sat_vals, act_vals)
new_act_vals %>%
    mutate(act_vals_piped = new_sat_to_act(new_sat_vals))
#>    new_sat_vals act_vals act_vals_piped
#> 1          1180       24             24
#> 2          1310       28             28
#> 3          1270       26             26
#> 4           950       18             18
#> 5           880       16             16
#> 6           770       14             14
#> 7          1020       20             20
#> 8           820       15             15
#> 9          1100       22             22
#> 10         1370       29             29

# Recode new SAT writing and language section to ACT Enlish/Writing test
new_sat_vals <- sample(17:40, 10)
act_vals <- new_sat_writing_to_act_english(new_sat_vals)
new_act_vals <- data.frame(new_sat_vals, act_vals)
new_act_vals %>%
    mutate(act_vals_piped = new_sat_to_act(new_sat_vals))
#>    new_sat_vals act_vals act_vals_piped
#> 1            22       15             NA
#> 2            18       12             NA
#> 3            34       28             NA
#> 4            30       23             NA
#> 5            37       32             NA
#> 6            40       34             NA
#> 7            25       18             NA
#> 8            35       29             NA
#> 9            23       16             NA
#> 10           38       33             NA
```

#### Examples of recoding old scores to new scores:

``` r
suppressMessages(require("satconcordance"))
suppressMessages(require("dplyr"))

# Recode old SAT (2400 scale) to new SAT (1600 scale)
old_sat_vals <- round(sample(600:2400, 10), -1)
new_sat_vals <- old_sat_to_new_sat_2400(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
    mutate(new_sat_vals_piped = old_sat_to_new_sat_2400(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1          1120          840                840
#> 2          2290         1550               1550
#> 3          2190         1510               1510
#> 4          1630         1180               1180
#> 5          1700         1220               1220
#> 6           760          560                560
#> 7           800          610                610
#> 8          1770         1270               1270
#> 9          2230         1530               1530
#> 10         1990         1400               1400

# Recode old SAT (1600 scale) to new SAT (1600 scale)
old_sat_vals <- round(sample(400:1600, 10), -1)
new_sat_vals <- old_sat_to_new_sat_1600(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
    mutate(new_sat_vals_piped = old_sat_to_new_sat_1600(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           710          800                800
#> 2          1600         1600               1600
#> 3          1550         1560               1560
#> 4          1210         1280               1280
#> 5           810          890                890
#> 6          1380         1430               1430
#> 7          1360         1420               1420
#> 8          1140         1210               1210
#> 9          1380         1430               1430
#> 10          550          620                620

# Recode old SAT writing plus critical reading sections to new SAT EBRW section
old_sat_vals <- round(sample(400:1600, 10), -1)
new_sat_vals <- old_sat_writingreading_to_new_ebrw(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_writingreading_to_new_ebrw(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1          1160          640                640
#> 2          1510          770                770
#> 3          1340          710                710
#> 4           480          290                290
#> 5          1530          780                780
#> 6           980          550                550
#> 7           890          500                500
#> 8           780          440                440
#> 9          1560          790                790
#> 10          890          500                500

# Recode old SAT math section to new SAT math section (200-800 scale)
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_math_to_new_sat_math_section(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
    mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_section(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           400          440                440
#> 2           600          620                620
#> 3           400          440                440
#> 4           720          750                750
#> 5           670          700                700
#> 6           700          730                730
#> 7           560          580                580
#> 8           510          540                540
#> 9           430          470                470
#> 10          490          520                520

# Recode old SAT math section to new SAT math test (10-40 scale)
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_math_to_new_sat_math_test(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_test(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           780         39.5               39.5
#> 2           790         40.0               40.0
#> 3           650         33.5               33.5
#> 4           320         18.0               18.0
#> 5           710         37.0               37.0
#> 6           780         39.5               39.5
#> 7           660         34.5               34.5
#> 8           490         26.0               26.0
#> 9           340         19.0               19.0
#> 10          590         30.5               30.5

# Recode old SAT writing test to new SAT writing and language section
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_writing_to_new_sat_writing(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_writing_to_new_sat_writing(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           520           29                 29
#> 2           720           37                 37
#> 3           790           40                 40
#> 4           250           14                 14
#> 5           550           31                 31
#> 6           480           28                 28
#> 7           740           38                 38
#> 8           770           39                 39
#> 9           560           31                 31
#> 10          380           22                 22

# Recode old SAT critical reading test to new SAT reading section
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_reading_to_new_sat_reading(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_reading_to_new_sat_reading(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           670           36                 36
#> 2           480           26                 26
#> 3           770           39                 39
#> 4           240           13                 13
#> 5           340           19                 19
#> 6           490           27                 27
#> 7           200           10                 10
#> 8           540           29                 29
#> 9           490           27                 27
#> 10          700           37                 37

# Recode ACT to new SAT (1600 scale)
act_vals <- sample(11:36, 10)
new_sat_vals <- act_to_new_sat(act_vals)
act_new_vals <- data.frame(act_vals, new_sat_vals)
act_new_vals %>%
   mutate(new_sat_vals_piped = act_to_new_sat(act_vals))
#>    act_vals new_sat_vals new_sat_vals_piped
#> 1        36         1600               1600
#> 2        35         1570               1570
#> 3        18          950                950
#> 4        30         1400               1400
#> 5        13          740                740
#> 6        16          870                870
#> 7        23         1140               1140
#> 8        25         1220               1220
#> 9        19          990                990
#> 10       21         1070               1070

# Recode ACT Enlish/Writing test to new SAT writing and language section
act_vals <- sample(11:36, 10)
new_sat_vals <- act_english_to_new_sat_writing(act_vals)
act_new_vals <- data.frame(act_vals, new_sat_vals)
act_new_vals %>%
    mutate(new_sat_vals_piped = act_english_to_new_sat_writing(act_vals))
#>    act_vals new_sat_vals new_sat_vals_piped
#> 1        19           26                 26
#> 2        28           34                 34
#> 3        15           22                 22
#> 4        34           39                 39
#> 5        24           31                 31
#> 6        23           30                 30
#> 7        18           25                 25
#> 8        35           40                 40
#> 9        30           36                 36
#> 10       36           40                 40
```
