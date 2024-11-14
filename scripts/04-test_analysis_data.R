#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 26 September 2024 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


# Load necessary libraries
library(tidyverse)
library(testthat)
library(here)

# Load data using `here` for file paths
discount_bymonth <- read_csv(here::here("data/02-analysis_data/discount_bymonth.csv"))
discount_byvendors <- read_csv(here::here("data/02-analysis_data/discount_byvendors.csv"))

#### Test data ####

# Ensure testthat setup
context("Data validation tests for discount datasets")

# Test 1: Check if the datasets have the expected columns
test_that("Expected columns are present in discount datasets", {
  expected_columns_bymonth <- c("month", "avg_discount")
  expected_columns_byvendors <- c("vendor", "avg_discount")
  
  # Check columns in each dataset
  expect_true(all(expected_columns_bymonth %in% colnames(discount_bymonth)))
  expect_true(all(expected_columns_byvendors %in% colnames(discount_byvendors)))
})

# Test 2: Check if `discount_bymonth` has the correct number of rows (12 for each month)
test_that("discount_bymonth has 10 rows", {
  expect_equal(nrow(discount_bymonth), 10)
})

# Test 3: Check if `discount_byvendors` has the correct number of rows (8 for each vendor)
test_that("discount_byvendors has 8 rows", {
  expect_equal(nrow(discount_byvendors), 8)
})

# Test 4: Check if the 'month' column in `discount_bymonth` has values between 1 and 12
test_that("'month' column contains values between 1 and 12", {
  valid_months <- 1:12
  expect_true(all(discount_bymonth$month %in% valid_months))
})

# Test 5: Check if the 'avg_discount' column in both datasets is numeric
test_that("'avg_discount' column is numeric in both datasets", {
  expect_type(discount_bymonth$avg_discount, "double")
  expect_type(discount_byvendors$avg_discount, "double")
})

# Test 6: Check if there are no missing values in both datasets
test_that("no missing values in both datasets", {
  expect_true(all(!is.na(discount_bymonth)))
  expect_true(all(!is.na(discount_byvendors)))
})

# Test 7: Check if 'vendor' column in `discount_byvendors` contains expected vendor names
test_that("'vendor' column contains expected vendor names", {
  valid_vendors <- c("NoFrills", "Voila", "Loblaws", "SaveOnFoods", "Metro", "TandT", "Galleria", "Walmart")
  expect_true(all(discount_byvendors$vendor %in% valid_vendors))
})

# Test 8: Check if 'avg_discount' values are within realistic ranges in both datasets
test_that("'avg_discount' values are within realistic ranges in both datasets", {
  # Expected ranges
  expect_true(all(discount_bymonth$avg_discount >= 1 & discount_bymonth$avg_discount <= 5))
  expect_true(all(discount_byvendors$avg_discount >= 1 & discount_byvendors$avg_discount <= 7))
})
