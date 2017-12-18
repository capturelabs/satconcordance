
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
#> 1          1420         2020               2020
#> 2           540          730                730
#> 3           650          840                840
#> 4          1590         2370               2370
#> 5           920         1240               1240
#> 6           920         1240               1240
#> 7          1080         1480               1480
#> 8          1480         2130               2130
#> 9           580          770                770
#> 10         1030         1400               1400

#Recode new SAT (1600 scale) to old SAT (1600 scale)
new_sat_vals <- round(sample(400:1600, 10), -1)
old_sat_vals <- new_sat_to_old_sat_1600(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_to_old_sat_1600(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1           670          580                580
#> 2          1500         1460               1460
#> 3           580          520                520
#> 4           910          830                830
#> 5          1240         1170               1170
#> 6          1340         1280               1280
#> 7          1410         1350               1350
#> 8           520          480                480
#> 9           560          510                510
#> 10          980          900                900

# Recode new SAT math section to old SAT math section
new_sat_vals <- round(sample(200:800, 10), -1)
old_sat_vals <- new_sat_math_to_old_sat_math(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_math_to_old_sat_math(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1           460          420                420
#> 2           560          530                530
#> 3           300          260                260
#> 4           760          740                740
#> 5           600          580                580
#> 6           570          550                550
#> 7           780          760                760
#> 8           800          800                800
#> 9           670          650                650
#> 10          380          340                340

# Recode new SAT writing and language test to old SAT writing section
new_sat_vals <- sample(10:40, 10)
old_sat_vals <- new_sat_writing_to_old_sat_writing(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_writing_to_old_sat_writing(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1            18          320                320
#> 2            19          340                340
#> 3            35          650                650
#> 4            27          470                470
#> 5            40          790                790
#> 6            17          300                300
#> 7            37          710                710
#> 8            23          400                400
#> 9            14          260                260
#> 10           10          200                200

# Recode new SAT reading test to old SAT critical reading section
new_sat_vals <- sample(10:40, 10)
old_sat_vals <- new_sat_reading_to_old_sat_reading(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_reading_to_old_sat_reading(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1            15          260                260
#> 2            40          790                790
#> 3            17          280                280
#> 4            29          530                530
#> 5            36          680                680
#> 6            39          760                760
#> 7            11          210                210
#> 8            33          610                610
#> 9            38          720                720
#> 10           27          500                500

# Recode new SAT EBRW section to old SAT writing plus critical reading sections
new_sat_vals <- round(sample(200:800, 10), -1)
old_sat_vals <- new_sat_ebrw_to_old_writingreading(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_ebrw_to_old_writingreading(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1           720         1370               1370
#> 2           630         1150               1150
#> 3           260          450                450
#> 4           300          490                490
#> 5           740         1420               1420
#> 6           280          470                470
#> 7           700         1310               1310
#> 8           210          410                410
#> 9           400          710                710
#> 10          280          470                470

# Recode new SAT (1600 scale) to ACT
new_sat_vals <- round(sample(560:1600, 10), -1)
act_vals <- new_sat_to_act(new_sat_vals)
new_act_vals <- data.frame(new_sat_vals, act_vals)
new_act_vals %>%
    mutate(act_vals_piped = new_sat_to_act(new_sat_vals))
#>    new_sat_vals act_vals act_vals_piped
#> 1           870       16             16
#> 2          1010       19             19
#> 3          1530       34             34
#> 4          1140       23             23
#> 5           950       18             18
#> 6          1520       34             34
#> 7          1020       20             20
#> 8          1570       35             35
#> 9           680       12             12
#> 10         1200       25             25

# Recode new SAT writing and language section to ACT Enlish/Writing test
new_sat_vals <- sample(17:40, 10)
act_vals <- new_sat_writing_to_act_english(new_sat_vals)
new_act_vals <- data.frame(new_sat_vals, act_vals)
new_act_vals %>%
    mutate(act_vals_piped = new_sat_to_act(new_sat_vals))
#>    new_sat_vals act_vals act_vals_piped
#> 1            36       30             36
#> 2            34       28             34
#> 3            38       33             38
#> 4            33       26             33
#> 5            30       23             30
#> 6            22       15             22
#> 7            31       24             31
#> 8            20       13             20
#> 9            25       18             25
#> 10           39       33             39
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
#> 1          2110         1470               1470
#> 2           610          410                410
#> 3          2060         1440               1440
#> 4           820          630                630
#> 5          1830         1300               1300
#> 6          1040          790                790
#> 7          1510         1100               1100
#> 8          2170         1500               1500
#> 9          1980         1400               1400
#> 10          930          720                720

# Recode old SAT (1600 scale) to new SAT (1600 scale)
old_sat_vals <- round(sample(400:1600, 10), -1)
new_sat_vals <- old_sat_to_new_sat_1600(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
    mutate(new_sat_vals_piped = old_sat_to_new_sat_1600(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1          1470         1510               1510
#> 2          1310         1370               1370
#> 3          1160         1230               1230
#> 4           600          700                700
#> 5           820          900                900
#> 6           440          460                460
#> 7          1520         1540               1540
#> 8           660          750                750
#> 9           580          670                670
#> 10          430          450                450

# Recode old SAT writing plus critical reading sections to new SAT EBRW section
old_sat_vals <- round(sample(400:1600, 10), -1)
new_sat_vals <- old_sat_writingreading_to_new_ebrw(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_writingreading_to_new_ebrw(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           520          320                320
#> 2           780          440                440
#> 3          1110          610                610
#> 4           510          310                310
#> 5           780          440                440
#> 6          1590          800                800
#> 7          1170          640                640
#> 8           890          500                500
#> 9           700          400                400
#> 10          590          350                350

# Recode old SAT math section to new SAT math section (200-800 scale)
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_math_to_new_sat_math_section(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
    mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_section(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           690          720                720
#> 2           370          410                410
#> 3           730          760                760
#> 4           220          230                230
#> 5           740          760                760
#> 6           720          750                750
#> 7           420          460                460
#> 8           570          590                590
#> 9           630          650                650
#> 10          750          770                770

# Recode old SAT math section to new SAT math test (10-40 scale)
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_math_to_new_sat_math_test(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_test(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           520         27.5               27.5
#> 2           450         24.5               24.5
#> 3           710         37.0               37.0
#> 4           590         30.5               30.5
#> 5           640         33.0               33.0
#> 6           620         32.0               32.0
#> 7           350         19.5               19.5
#> 8           530         28.0               28.0
#> 9           570         29.5               29.5
#> 10          620         32.0               32.0

# Recode old SAT writing test to new SAT writing and language section
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_writing_to_new_sat_writing(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_writing_to_new_sat_writing(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           490           28                 28
#> 2           700           37                 37
#> 3           790           40                 40
#> 4           740           38                 38
#> 5           600           33                 33
#> 6           340           19                 19
#> 7           220           11                 11
#> 8           210           11                 11
#> 9           310           18                 18
#> 10          520           29                 29

# Recode old SAT critical reading test to new SAT reading section
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_reading_to_new_sat_reading(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_reading_to_new_sat_reading(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           480           26                 26
#> 2           210           11                 11
#> 3           650           35                 35
#> 4           680           36                 36
#> 5           280           17                 17
#> 6           440           24                 24
#> 7           430           24                 24
#> 8           200           10                 10
#> 9           360           20                 20
#> 10          410           22                 22

# Recode ACT to new SAT (1600 scale)
act_vals <- sample(11:36, 10)
new_sat_vals <- act_to_new_sat(act_vals)
act_new_vals <- data.frame(act_vals, new_sat_vals)
act_new_vals %>%
   mutate(new_sat_vals_piped = act_to_new_sat(act_vals))
#>    act_vals new_sat_vals new_sat_vals_piped
#> 1        33         1500               1500
#> 2        11          590                590
#> 3        15          830                830
#> 4        28         1320               1320
#> 5        25         1220               1220
#> 6        14          780                780
#> 7        21         1070               1070
#> 8        22         1110               1110
#> 9        32         1470               1470
#> 10       17          910                910

# Recode ACT Enlish/Writing test to new SAT writing and language section
act_vals <- sample(11:36, 10)
new_sat_vals <- act_english_to_new_sat_writing(act_vals)
act_new_vals <- data.frame(act_vals, new_sat_vals)
act_new_vals %>%
    mutate(new_sat_vals_piped = act_english_to_new_sat_writing(act_vals))
#>    act_vals new_sat_vals new_sat_vals_piped
#> 1        27           33                 33
#> 2        20           27                 27
#> 3        15           22                 22
#> 4        21           28                 28
#> 5        23           30                 30
#> 6        28           34                 34
#> 7        12           19                 19
#> 8        18           25                 25
#> 9        33           38                 38
#> 10       13           19                 19
```
