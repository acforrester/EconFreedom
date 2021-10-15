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

# -------------------------------------------------------------------------
# Metadata from the World Bank:
#
# In this step I add in World Bank region and income group classifiers to
# join on the EFW data in place of the provided regions. This modification
# adds the World Bank's region code and the income group
# -------------------------------------------------------------------------


# World Bank regions
url = "http://databank.worldbank.org/data/download/site-content/CLASS.xlsx"
file = paste0("data-prep/", basename(url))

# download file
if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}

# clean up countries
wb_group <- readxl::read_excel(file) %>%
  rename(wb_name      = 1,
         iso_code     = 2,
         region_name  = 3,
         income_group = 4) %>%
  select(1:4)

# clean up regions
wb_codes <- wb_group %>%
  filter(!is.na(wb_name), is.na(region_name)) %>%
  select(region_name = wb_name, region_code = iso_code)

# now combine the data
wb_group <- wb_group %>%
  filter(!is.na(region_name)) %>%
  left_join(., wb_codes, by = "region_name") %>%
  # reorder
  select(iso_code, wb_name, region_code, region_name, income_group)

# -------------------------------------------------------------------------
# Economic Freedom of the World (EFW)
#
# Download and clean up the Gwartney et al. Economic Freedom of the World
# (EFW) data.
# -------------------------------------------------------------------------

# EFW data
url  = "https://www.fraserinstitute.org/sites/default/files/economic-freedom-of-the-world-2021-master-index-data-for-researchers-iso.xlsx"
file = paste0("data-prep/", basename(url))

# download file
if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}

# now clean up the EFW data
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
  # join on the World Bank metadata
  left_join(., wb_group, by = "iso_code") %>%
  # order columns
  select(iso_code, country_name, year, region_code, region_name, income_group,
         everything(), -wb_name) %>%
  arrange(iso_code, year)

# save internal data
usethis::use_data(efwpnl, overwrite = T)

# -------------------------------------------------------------------------
# Economic Freedom of North America (EFNA)
#
# Download and clean up the Stansel et al. Economic Freedom of North
# America (EFNA) data. Also add in the U.S. state FIPS codes for easy
# use with other datasets.
# -------------------------------------------------------------------------

# state FIPS codes
stfips <- read_delim("https://www2.census.gov/geo/docs/reference/state.txt", delim = "|") %>%
  select(stfips = STATE,
         usps = STUSAB,
         state_name = STATE_NAME)

# EFNA dataset
url  = "https://www.fraserinstitute.org/sites/default/files/economic-freedom-north-america-2020-panel-dataset.xlsx"
file = paste0("data-prep/", basename(url))

# download file
if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}

# now clean up the EFNA data
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
usethis::use_data(efna, overwrite = T)
