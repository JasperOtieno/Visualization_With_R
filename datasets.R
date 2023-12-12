# Script Header ----
# Name: Jasper Otieno
# Title: Shiny Dashboard Project
# Task: Cleaning dataset
# Date: 10Dec2023


# Load packages ----

if(!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse
          
)

#gapminder dataset ----

gap <- gapminder::gapminder

co2 <- datasets::CO2 

