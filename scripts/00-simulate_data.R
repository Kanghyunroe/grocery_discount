#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(853)


#### Simulate data ####
# State names
states <- c(
  "New South Wales",
  "Victoria",
  "Queensland",
  "South Australia",
  "Western Australia",
  "Tasmania",
  "Northern Territory",
  "Australian Capital Territory"
)

# Load necessary library
library(tidyverse)
set.seed(853)

# Simulate month and avg_discount data for months 1-12
month_data <- tibble(
  month = sprintf("%02d", 1:12),  # Months from 01 to 12 in two-digit format
  avg_discount = round(runif(12, 1, 5), 10)  # Random avg_discount values between 1 and 5
)

# Simulate vendor and avg_discount data
vendor_data <- tibble(
  vendor = c("NoFrills", "Voila", "Loblaws", "SaveOnFoods", "Metro", "TandT", "Galleria", "Walmart"),
  avg_discount = round(runif(8, 1, 7), 10)  # Random avg_discount values between 1 and 7
)

# Display the data
print(month_data)
print(vendor_data)

# Save to CSV
write_csv(month_data, "data/00-simulated_data/simulated_month_data.csv")
write_csv(vendor_data, "data/00-simulated_data/simulated_vendor_data.csv")
