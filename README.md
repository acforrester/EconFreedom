
# About

`EconFreedom` contains the economic freedom scores for countries and US
states.

## Installation

``` r
# install.package("devtools")
devtools::install_github("acforrester/EconFreedom")
```

## Datasets

### Economic Freedom of the World (EFW)

``` r
library(tidyverse)
#> -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.5     v purrr   0.3.4
#> v tibble  3.1.3     v dplyr   1.0.7
#> v tidyr   1.1.3     v stringr 1.4.0
#> v readr   2.0.1     v forcats 0.5.1
#> -- Conflicts ------------------------------------------ tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()

EconFreedom::efwpnl %>% 
  filter(iso_code == "USA")
#> # A tibble: 25 x 9
#>    iso_code  year country_name  efw_index size_of_govt legal_system sound_money
#>    <chr>    <dbl> <chr>             <dbl>        <dbl>        <dbl>       <dbl>
#>  1 USA       1970 United States      7.92         8.37         7.37        9.59
#>  2 USA       1975 United States      8.15         7.40         7.82        9.26
#>  3 USA       1980 United States      8.19         7.14         7.76        9.22
#>  4 USA       1985 United States      8.38         7.50         8.33        9.36
#>  5 USA       1990 United States      8.49         7.90         8.01        9.68
#>  6 USA       1995 United States      8.56         7.76         8.25        9.76
#>  7 USA       2000 United States      8.6          7.78         8.35        9.78
#>  8 USA       2001 United States      8.47         7.59         8.17        9.73
#>  9 USA       2002 United States      8.54         7.86         7.95        9.80
#> 10 USA       2003 United States      8.54         8.05         7.84        9.82
#> # ... with 15 more rows, and 2 more variables: trade_freedom <dbl>,
#> #   regulation <dbl>
```

### Economic Freedom of North America (EFNA)

``` r
library(tidyverse)

EconFreedom::efna %>% 
  filter(usps == "IL")
#> # A tibble: 38 x 8
#>    stfips usps  state_name  year efna_index efna_spending efna_taxation
#>    <chr>  <chr> <chr>      <dbl>      <dbl>         <dbl>         <dbl>
#>  1 17     IL    Illinois    1981       4.51          5.34          5.97
#>  2 17     IL    Illinois    1982       4.61          5.49          6.14
#>  3 17     IL    Illinois    1983       4.38          5.03          5.90
#>  4 17     IL    Illinois    1984       5.05          6.07          6.16
#>  5 17     IL    Illinois    1985       5.17          6.07          6.21
#>  6 17     IL    Illinois    1986       5.27          6.12          6.20
#>  7 17     IL    Illinois    1987       5.41          6.15          6.24
#>  8 17     IL    Illinois    1988       5.69          6.59          6.20
#>  9 17     IL    Illinois    1989       5.95          7.08          6.20
#> 10 17     IL    Illinois    1990       5.83          7.10          6.02
#> # ... with 28 more rows, and 1 more variable: efna_lab_mkt <dbl>
```

## Citations

James Gwartney, Robert Lawson, Joshua Hall, and Ryan Murphy (2020).
Economic Freedom of the World: 2020 Edition. Fraser Institute.

Dean Stansel, José Torra, and Fred McMahon (2020). Economic Freedom of
North America 2020. Fraser Institute.
