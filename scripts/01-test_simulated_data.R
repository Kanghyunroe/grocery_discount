#### Preamble ####
# Purpose: Tests the structure and validity of the simulated discount data
# Author: Kevin Roe, Cher Ning-Li, Fangning Zhang
# Date: 14 November 2024
# Contact: cher.ning@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run


#### Workspace setup ####
library(tidyverse)

# Load datasets
month_data <- read_csv("data/00-simulated_data/simulated_month_data.csv")
vendor_data <- read_csv("data/00-simulated_data/simulated_vendor_data.csv")

#### Test month_data ####

# Check if the dataset was successfully loaded
if (exists("month_data")) {
  message("Test Passed: The month_data dataset was successfully loaded.")
} else {
  stop("Test Failed: The month_data dataset could not be loaded.")
}

# Check if month_data has 12 rows
if (nrow(month_data) == 12) {
  message("Test Passed: month_data has 12 rows.")
} else {
  stop("Test Failed: month_data does not have 12 rows.")
}

# Check if month_data has 2 columns
if (ncol(month_data) == 2) {
  message("Test Passed: month_data has 2 columns.")
} else {
  stop("Test Failed: month_data does not have 2 columns.")
}

# Check if 'month' column contains values from "01" to "12"
valid_months <- sprintf("%02d", 1:12)
if (all(month_data$month %in% valid_months)) {
  message("Test Passed: The 'month' column contains valid month values from 01 to 12.")
} else {
  stop("Test Failed: The 'month' column contains invalid month values.")
}

# Check if 'avg_discount' values are numeric and within the expected range (1 to 5)
if (is.numeric(month_data$avg_discount) && all(month_data$avg_discount >= 1 & month_data$avg_discount <= 5)) {
  message("Test Passed: 'avg_discount' values in month_data are numeric and within the range of 1 to 5.")
} else {
  stop("Test Failed: 'avg_discount' values in month_data are not within the expected range or not numeric.")
}

# Check if there are any missing values in month_data
if (all(!is.na(month_data))) {
  message("Test Passed: month_data contains no missing values.")
} else {
  stop("Test Failed: month_data contains missing values.")
}

#### Test vendor_data ####

# Check if the dataset was successfully loaded
if (exists("vendor_data")) {
  message("Test Passed: The vendor_data dataset was successfully loaded.")
} else {
  stop("Test Failed: The vendor_data dataset could not be loaded.")
}

# Check if vendor_data has 8 rows
if (nrow(vendor_data) == 8) {
  message("Test Passed: vendor_data has 8 rows.")
} else {
  stop("Test Failed: vendor_data does not have 8 rows.")
}

# Check if vendor_data has 2 columns
if (ncol(vendor_data) == 2) {
  message("Test Passed: vendor_data has 2 columns.")
} else {
  stop("Test Failed: vendor_data does not have 2 columns.")
}

# Check if 'vendor' column contains the expected vendor names
valid_vendors <- c("NoFrills", "Voila", "Loblaws", "SaveOnFoods", "Metro", "TandT", "Galleria", "Walmart")
if (all(vendor_data$vendor %in% valid_vendors)) {
  message("Test Passed: The 'vendor' column contains valid vendor names.")
} else {
  stop("Test Failed: The 'vendor' column contains invalid vendor names.")
}

# Check if 'avg_discount' values are numeric and within the expected range (1 to 7)
if (is.numeric(vendor_data$avg_discount) && all(vendor_data$avg_discount >= 1 & vendor_data$avg_discount <= 7)) {
  message("Test Passed: 'avg_discount' values in vendor_data are numeric and within the range of 1 to 7.")
} else {
  stop("Test Failed: 'avg_discount' values in vendor_data are not within the expected range or not numeric.")
}

# Check if there are any missing values in vendor_data
if (all(!is.na(vendor_data))) {
  message("Test Passed: vendor_data contains no missing values.")
} else {
  stop("Test Failed: vendor_data contains missing values.")
}

