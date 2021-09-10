
<!-- README.md is generated from README.Rmd. Please edit that file -->
satconcordance
==============

The goal of satconcordance is to make it easy to recode a column of SAT® scores into new or old, SAT® or ACT® scores.

Overview
--------

This package provides functions to recode SAT® scores according to any table in the SAT® Concordance Tables (Released 5/9/2016): this includes new SAT® to old SAT® values, old SAT® to new SAT® values, new SAT® to ACT® values, and ACT® to new SAT® values. All functions call dplyr::recode() to perform optimized recodes. Each function accepts a vector of values, recodes it, and returns the recoded vector. Missing and unmatched values are coded as missing.

Disclaimers
-----------

SAT® is a trademark registered by the College Board, which is not affiliated with, and does not endorse, this website or code base. ACT® is a trademark registered by the ACT, which is not affiliated with, and does not endorse, this website or code base.

Installation
------------

You can install satconcordance from github with:

``` r
# install.packages("devtools")
devtools::install_github("alberto-guzman/satconcordance")
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
#> 1           490          690                690
#> 2          1600         2390               2390
#> 3          1040         1420               1420
#> 4          1450         2080               2080
#> 5          1500         2170               2170
#> 6          1230         1710               1710
#> 7          1070         1460               1460
#> 8          1030         1400               1400
#> 9           880         1180               1180
#> 10          490          690                690

# Recode new SAT (1600 scale) to old SAT (1600 scale)
new_sat_vals <- round(sample(400:1600, 10), -1)
old_sat_vals <- new_sat_to_old_sat_1600(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_to_old_sat_1600(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1          1130         1060               1060
#> 2          1040          960                960
#> 3          1140         1070               1070
#> 4           400          400                400
#> 5           950          870                870
#> 6          1060          980                980
#> 7           440          430                430
#> 8          1580         1570               1570
#> 9          1500         1460               1460
#> 10          440          430                430

# Recode new SAT math section to old SAT math section
new_sat_vals <- round(sample(200:800, 10), -1)
old_sat_vals <- new_sat_math_to_old_sat_math(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_math_to_old_sat_math(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1           210          200                200
#> 2           580          560                560
#> 3           400          360                360
#> 4           610          590                590
#> 5           790          780                780
#> 6           650          630                630
#> 7           400          360                360
#> 8           740          710                710
#> 9           210          200                200
#> 10          270          240                240

# Recode new SAT writing and language test to old SAT writing section
new_sat_vals <- sample(10:40, 10)
old_sat_vals <- new_sat_writing_to_old_sat_writing(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_writing_to_old_sat_writing(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1            25          430                430
#> 2            20          350                350
#> 3            39          760                760
#> 4            27          470                470
#> 5            19          340                340
#> 6            26          450                450
#> 7            12          230                230
#> 8            23          400                400
#> 9            36          680                680
#> 10           34          630                630

# Recode new SAT reading test to old SAT critical reading section
new_sat_vals <- sample(10:40, 10)
old_sat_vals <- new_sat_reading_to_old_sat_reading(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_reading_to_old_sat_reading(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1            22          400                400
#> 2            15          260                260
#> 3            19          340                340
#> 4            31          570                570
#> 5            21          380                380
#> 6            10          200                200
#> 7            17          280                280
#> 8            28          520                520
#> 9            40          790                790
#> 10           38          720                720

# Recode new SAT EBRW section to old SAT writing plus critical reading sections
new_sat_vals <- round(sample(200:800, 10), -1)
old_sat_vals <- new_sat_ebrw_to_old_writingreading(new_sat_vals)
new_old_vals <- data.frame(new_sat_vals, old_sat_vals)
new_old_vals %>%
    mutate(old_sat_vals_piped = new_sat_ebrw_to_old_writingreading(new_sat_vals))
#>    new_sat_vals old_sat_vals old_sat_vals_piped
#> 1           440          790                790
#> 2           800         1590               1590
#> 3           430          770                770
#> 4           430          770                770
#> 5           780         1540               1540
#> 6           720         1370               1370
#> 7           770         1510               1510
#> 8           240          440                440
#> 9           620         1120               1120
#> 10          260          450                450

# Recode new SAT (1600 scale) to ACT
new_sat_vals <- round(sample(560:1600, 10), -1)
act_vals <- new_sat_to_act(new_sat_vals)
new_act_vals <- data.frame(new_sat_vals, act_vals)
new_act_vals %>%
    mutate(act_vals_piped = new_sat_to_act(new_sat_vals))
#>    new_sat_vals act_vals act_vals_piped
#> 1          1080       21             21
#> 2           960       18             18
#> 3          1370       29             29
#> 4          1260       26             26
#> 5          1300       27             27
#> 6          1370       29             29
#> 7          1300       27             27
#> 8          1510       33             33
#> 9           980       19             19
#> 10          990       19             19

# Recode new SAT writing and language section to ACT Enlish/Writing test
new_sat_vals <- sample(17:40, 10)
act_vals <- new_sat_writing_to_act_english(new_sat_vals)
new_act_vals <- data.frame(new_sat_vals, act_vals)
new_act_vals %>%
    mutate(act_vals_piped = new_sat_to_act(new_sat_vals))
#>    new_sat_vals act_vals act_vals_piped
#> 1            32       25             NA
#> 2            19       13             NA
#> 3            17       11             NA
#> 4            26       19             NA
#> 5            37       32             NA
#> 6            31       24             NA
#> 7            25       18             NA
#> 8            20       13             NA
#> 9            27       20             NA
#> 10           33       26             NA
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
#> 1          2070         1450               1450
#> 2          1700         1220               1220
#> 3          1860         1320               1320
#> 4          2090         1460               1460
#> 5          1210          900                900
#> 6           960          740                740
#> 7          1160          870                870
#> 8           600          400                400
#> 9           790          600                600
#> 10         1090          820                820

# Recode old SAT (1600 scale) to new SAT (1600 scale)
old_sat_vals <- round(sample(400:1600, 10), -1)
new_sat_vals <- old_sat_to_new_sat_1600(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
    mutate(new_sat_vals_piped = old_sat_to_new_sat_1600(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           430          450                450
#> 2          1510         1540               1540
#> 3           880          960                960
#> 4           480          520                520
#> 5           420          430                430
#> 6           820          900                900
#> 7           750          840                840
#> 8           630          730                730
#> 9          1380         1430               1430
#> 10         1460         1500               1500

# Recode old SAT writing plus critical reading sections to new SAT EBRW section
old_sat_vals <- round(sample(400:1600, 10), -1)
new_sat_vals <- old_sat_writingreading_to_new_ebrw(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_writingreading_to_new_ebrw(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           920          510                510
#> 2          1010          560                560
#> 3          1450          750                750
#> 4           450          260                260
#> 5           460          270                270
#> 6           800          450                450
#> 7          1120          620                620
#> 8          1080          600                600
#> 9          1130          620                620
#> 10         1190          650                650

# Recode old SAT math section to new SAT math section (200-800 scale)
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_math_to_new_sat_math_section(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
    mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_section(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           430          470                470
#> 2           610          630                630
#> 3           390          430                430
#> 4           610          630                630
#> 5           660          690                690
#> 6           250          280                280
#> 7           740          760                760
#> 8           720          750                750
#> 9           590          610                610
#> 10          760          780                780

# Recode old SAT math section to new SAT math test (10-40 scale)
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_math_to_new_sat_math_test(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_math_to_new_sat_math_test(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           530         28.0               28.0
#> 2           680         35.5               35.5
#> 3           450         24.5               24.5
#> 4           250         14.0               14.0
#> 5           240         13.0               13.0
#> 6           300         17.5               17.5
#> 7           780         39.5               39.5
#> 8           720         37.5               37.5
#> 9           270         15.5               15.5
#> 10          530         28.0               28.0

# Recode old SAT writing test to new SAT writing and language section
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_writing_to_new_sat_writing(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_writing_to_new_sat_writing(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           490           28                 28
#> 2           560           31                 31
#> 3           280           16                 16
#> 4           780           40                 40
#> 5           300           17                 17
#> 6           700           37                 37
#> 7           360           21                 21
#> 8           620           34                 34
#> 9           510           29                 29
#> 10          260           14                 14

# Recode old SAT critical reading test to new SAT reading section
old_sat_vals <- round(sample(200:800, 10), -1)
new_sat_vals <- old_sat_reading_to_new_sat_reading(old_sat_vals)
old_new_vals <- data.frame(old_sat_vals, new_sat_vals)
old_new_vals %>%
   mutate(new_sat_vals_piped = old_sat_reading_to_new_sat_reading(old_sat_vals))
#>    old_sat_vals new_sat_vals new_sat_vals_piped
#> 1           310           18                 18
#> 2           570           31                 31
#> 3           580           31                 31
#> 4           260           15                 15
#> 5           630           34                 34
#> 6           610           33                 33
#> 7           400           22                 22
#> 8           590           32                 32
#> 9           600           32                 32
#> 10          640           34                 34

# Recode ACT to new SAT (1600 scale)
act_vals <- sample(11:36, 10)
new_sat_vals <- act_to_new_sat(act_vals)
act_new_vals <- data.frame(act_vals, new_sat_vals)
act_new_vals %>%
   mutate(new_sat_vals_piped = act_to_new_sat(act_vals))
#>    act_vals new_sat_vals new_sat_vals_piped
#> 1        29         1360               1360
#> 2        13          740                740
#> 3        16          870                870
#> 4        23         1140               1140
#> 5        31         1430               1430
#> 6        33         1500               1500
#> 7        35         1570               1570
#> 8        36         1600               1600
#> 9        26         1260               1260
#> 10       32         1470               1470

# Recode ACT Enlish/Writing test to new SAT writing and language section
act_vals <- sample(11:36, 10)
new_sat_vals <- act_english_to_new_sat_writing(act_vals)
act_new_vals <- data.frame(act_vals, new_sat_vals)
act_new_vals %>%
    mutate(new_sat_vals_piped = act_english_to_new_sat_writing(act_vals))
#>    act_vals new_sat_vals new_sat_vals_piped
#> 1        12           19                 19
#> 2        29           35                 35
#> 3        23           30                 30
#> 4        31           36                 36
#> 5        33           38                 38
#> 6        16           23                 23
#> 7        22           29                 29
#> 8        15           22                 22
#> 9        32           37                 37
#> 10       28           34                 34
```
