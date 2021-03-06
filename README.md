
# Economic Freedom Data

[`Installation`](#installation) \| [`Datasets`](#datasets) \|
[`Citations`](#citations) \| [`Changelog`](#changelog)

## About

`EconFreedom` is a data package that contains measures of economic
freedom for across countries and the U.S. states from two sources:

1.  Economic Freedom of the World (EFW)
2.  Economic Freedom of North America (EFNA)

To see additional documentation and examples, see
[here](docs/index.html).

## Contents

## Installation

``` r
# install.package("devtools")
devtools::install_github("acforrester/EconFreedom")
```

## Datasets

### Economic Freedom of the World (EFW)

The Economic Freedom of the World (EFW) report is produced by Gwartney
et al. and provides a quantitative index of the quality of countries’
economic institutions. The index contains the following elements:

| Area                           | Description                      |
|:-------------------------------|:---------------------------------|
| Area 1                         | Size of Government               |
| Area 2                         | Legal System and Property Rights |
| Area 3                         | Sound Money                      |
| Area 4                         | Freedom to Trade Internationally |
| Area 5                         | Regulation                       |
| Gender Legal Rights Adjustment |                                  |

The resulting `EFW` index is an equally weighted average of each area.
The index is only available for countries that have enough data to
construct the index in each year and is therefore spotty in earlier
years. The number of countries in each year’s `EFW` data changes as a
result. Be sure to check which countries are included in your sample
before conducting any empirical cross-country comparisons.

### Economic Freedom of North America (EFNA)

The Economic Freedom of North America (EFNA) report from Stansel et
al. provides a quantitative index that measures the quality of economic
institutions at the subnational level, viz. the U.S. states. The index
is designed to mimic the cross-country equivalent, the EFW, and is
comprised of the following indicators.

| Area   | Description          |
|:-------|:---------------------|
| Area 1 | Government Spending  |
| Area 2 | Taxes                |
| Area 3 | Labor Market Freedom |

The `EFNA` index itself is an equally weighted average of the three
areas.

## Citations

James Gwartney, Robert Lawson, Joshua Hall, and Ryan Murphy (2021).
*Economic Freedom Dataset, published in Economic Freedom of the World:
2021 Annual Report*. Fraser Institute.
[www.fraserinstitute.org/economic-freedom/dataset](www.fraserinstitute.org/economic-freedom/dataset)

Dean Stansel, José Torra, and Fred McMahon (2020). *Economic Freedom of
North America 2020*. Fraser Institute.
<https://www.fraserinstitute.org/studies/economic-freedom-of-north-america-2020>

## Changelog

-   10/15/2021: Updated the EFW to the 2021 report and added World Bank
    codes and additional documentation.
