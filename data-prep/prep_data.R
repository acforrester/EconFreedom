# Prep Economic Freedom Data
#
# AC Forrester
#
# Collect and clean the economic freedom scores from the Economic Freedom of
# the World (EFW) and the Economic Freedom of North America (EFNA) reports for
# 2020.
#
# Citations in README.md
#
# ******************************************************************************

# load packages to use
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse)

# EFW Panel Dataset -------------------------------------------------------

# EFW data
url  = "https://www.fraserinstitute.org/sites/default/files/efw-2020-master-index-data-for-researchers.xlsx"
file = paste0("data-prep/", basename(url))

if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}

efwpnl <- readxl::read_excel(file, sheet = 2) %>%
  rename(
    year          = `Year`,
    iso_code      = `ISO_Code`,
    country_name  = `Countries`,
    efw_index     = `Summary`,
    size_of_govt  = `Area 1`,
    legal_system  = `Area 2`,
    sound_money   = `Area 3`,
    trade_freedom = `Area 4`,
    regulation    = `Area 5`
  ) %>%
  select(iso_code, year, country_name, everything()) %>%
  arrange(iso_code, year)

# save internal data
usethis::use_data(efwpnl)

# EFNA Panel Dataset ------------------------------------------------------

# state FIPS codes
stfips <- read_delim("https://www2.census.gov/geo/docs/reference/state.txt", delim = "|") %>%
  select(stfips = STATE,
         usps = STUSAB,
         state_name = STATE_NAME)

# EFNA dataset
url  = "https://www.fraserinstitute.org/sites/default/files/economic-freedom-north-america-2020-panel-dataset.xlsx"
file = paste0("data-prep/", basename(url))

if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}

efna <- readxl::read_excel(file, sheet = 1) %>%
  rename(state_name = `Subnational Index`,
         year = `...2`,
         efna_index = `EFNA-overall`,
         efna_spending = `EFNA1-Spending`,
         efna_taxation = `EFNA2-Taxation`,
         efna_lab_mkt  = `EFNA3-Labor Markets`) %>%
  left_join(., stfips, by = "state_name") %>%
  select(stfips,usps,state_name,year, everything()) %>%
  arrange(stfips, year)

# save internal data
usethis::use_data(efna)
