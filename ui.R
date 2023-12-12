# Script Header ----
# Name: Jasper Otieno
# Title: Shiny Dashboard Project
# Date: 12Dec2023

# Load packages ----
if(!require(pacman)) install.packages("pacman")
pacman::p_load(shiny,
               shinydashboard #allows to add aesthetics like theme colour

)

# Defining the User Interface ----

ui <- dashboardPage(#creating the header bar
                    skin = "purple", #setting the theme for the title page
                    dashboardHeader(title = "PERFORMANCE OF VARIOUS SECTORS OF ECONOMY",
                                    titleWidth = '600px',
                                    disable= FALSE, #if TRUE title does not display
                                    dropdownMenu(type = "messages", badgeStatus = "success",
                                                 messageItem("Training Team",
                                                             "Please conplete all assignments.",
                                                 ),
                                                 messageItem("New User",
                                                             "Go through the app documentations",
                                                 )
                                    ),
                                    dropdownMenu(type = "notifications", badgeStatus = "warning",
                                                 notificationItem(icon = icon("users"), status = "info",
                                                                  "2 new countries added this week"
                                                 ),
                                                 notificationItem(icon = icon("warning"), status = "danger",
                                                                  "Enrolment near limit."
                                                 ),
                                                 notificationItem(icon = icon("user", lib = "glyphicon"),
                                                                  status = "warning", "You changed your username"
                                                 )
                                    ),
                                    dropdownMenu(type = "tasks", badgeStatus = "info",
                                                 taskItem(value = 80, color = "aqua",
                                                          "Clean data"
                                                 ),
                                                 taskItem(value = 60, color = "blue",
                                                          "Design UI"
                                                 ),
                                                 taskItem(value = 30, color = "green",
                                                          "Design server outputs"
                                                 ),
                                                 taskItem(value = 10, color = "red",
                                                          "Write documentation"
                                                 ),
                                                 taskItem(value = 0, color = "yellow",
                                                          "Other task"
                                                 )
                                    )
                                    ), 
                    #Creating the sidebar for controls
                    dashboardSidebar(disable = FALSE,
                                     width = '250px',
                                     collapsed = FALSE,
                                     sidebarSearchForm(label = "Enter a number", "searchText", "searchButton"),
                                     sidebarMenu(id = "tabs",
                                                 collapsed= FALSE,
                                        menuItem("Home", icon = icon("house"), tabName = "home",
                                                menuSubItem("About", tabName = "about", icon = icon("circle-info")),
                                                menuSubItem("Profile", tabName = "prof", icon = icon("user")),
                                                menuSubItem("Contacts", tabName = "about", icon = icon("phone"))
                                                ),
                                        #menuItem("Widgets", icon = icon("th"), tabName = "widgets", badgeLabel = "new",
                                        #                  badgeColor = "green"),
                                        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"),
                                                menuSubItem("Demographics", tabName = "demo", icon = icon("people-roof")),
                                                menuSubItem("Health", tabName = "heal", icon = icon("hospital")),
                                                menuSubItem("Education", tabName = "educ", icon = icon("school")),
                                                menuSubItem("Agriculture", tabName = "agric", icon = icon("tractor")),
                                                menuSubItem("Transport", tabName = "trans",icon = icon("car")),
                                                menuSubItem("Financials", tabName = "fin", icon = icon("suitcase")),
                                                menuSubItem("Employment", tabName = "empl", icon = icon("glasses")),
                                                menuSubItem("Communication", tabName = "comm", icon = icon("envelope")),
                                                menuSubItem("Water", tabName = "water", icon = icon("faucet-drip")),
                                                menuSubItem("Energy", tabName = "energ", icon = icon("fire")),
                                                menuSubItem("Religion", tabName = "rel", icon = icon("church")),
                                                menuSubItem("Hospitality", tabName = "hosp", icon = icon("bed")),
                                                menuSubItem("Sports", tabName = "sport", icon = icon("basketball"))
                                                )

                                       )
                                     ),
                                     
                    dashboardBody(tabItems(
                                          tabItem(tabName = "demo", dataTableOutput("mydatatable")),
                                          tabItem(tabName = "heal"),
                                          tabItem(tabName = "educ"),
                                          tabItem(tabName = "agric"),
                                          tabItem(tabName = "trans"),
                                          tabItem(tabName = "fin"),
                                          tabItem(tabName = "empl"),
                                          tabItem(tabName = "comm"),
                                          tabItem(tabName = "water"),
                                          tabItem(tabName = "energ"),
                                          tabItem(tabName = "rel"),
                                          tabItem(tabName = "hosp"),
                                          tabItem(tabName = "sport"))
                                  )
)


