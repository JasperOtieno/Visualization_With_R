# Script Header ----
# Name: Jasper Otieno
# Title: Shiny Dashboard Project
# Date: 12Dec2023

# Load packages ----
if(!require(pacman)) install.packages("pacman")
pacman::p_load(shiny,
               shinydashboard, #allows to add aesthetics like theme colour
               rsconnect,
               fresh
)

