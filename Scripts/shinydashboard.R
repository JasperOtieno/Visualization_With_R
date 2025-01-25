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

## The Header bar ----
ui <- dashboardPage(skin = "purple", ### Theme colour for title bar ----
                    dashboardHeader(title = "THE VARIOUS SECTORS OF ECONOMY", ### Title specs ----
                                    titleWidth = '450px',
                                    disable= FALSE, #if TRUE title does not display
                                    
                                    ### Dropdown menus ----
                                    #### Static Messages ----
                                    dropdownMenu(type = "messages", badgeStatus = "success",
                                                 messageItem(from = "Training Team",
                                                             message = "Please conplete all assignments."
                                                 ),
                                                 messageItem(from = "New User",
                                                             message = "Go through the app documentations"
                                                 )
                                    ),
                                    #### Notifications ----
                                    dropdownMenu(type = "notifications", badgeStatus = "warning",
                                                 notificationItem(icon = icon("earth"), 
                                                                  status = "info",
                                                                  text = "2 new countries added this week"
                                                 ),
                                                 
                                                 notificationItem(icon = icon("warning"), 
                                                                  status = "danger",
                                                                  text = "Enrolment near limit."
                                                 ),
                                                 
                                                 notificationItem(icon = icon("user", lib = "glyphicon"),
                                                                  status = "success", 
                                                                  text = "You changed your username"
                                                 )
                                    ),
                                    #### Tasks ----
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
                                                          "Look for data for the economy sectors"
                                                 )
                                    )
                    ), 
                    
                    ## The Sidebar for controls ----
                    dashboardSidebar(disable = FALSE,
                                     width = '250px',
                                     collapsed = FALSE,
                                     
                                     ### The Search field ----
                                     sidebarSearchForm(label = "Enter a number or text", "searchText", "searchButton"),
                                     
                                     ### Sidebar Items ----
                                     sidebarMenu(id = "tabs",
                                                 collapsed= FALSE,
                                                 
                                                 menuItem("Home", icon = icon("home"), tabName = "home",
                                                          menuSubItem("About", tabName = "about", icon = icon("circle-info")),
                                                          menuSubItem("Profile", tabName = "prof", icon = icon("user")),
                                                          menuSubItem("Contacts", tabName = "about", icon = icon("phone"))
                                                 ),
                                                 
                                                 menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"),
                                                          #### Sidebar Sub-items ----
                                                          menuSubItem("Demographics", tabName = "demo", icon = icon("people-roof")),
                                                          menuSubItem("Health", tabName = "heal", icon = icon("hospital")),
                                                          menuSubItem("Education", tabName = "educ", icon = icon("school")),
                                                          menuSubItem("Agriculture", tabName = "agric", icon = icon("tractor")),
                                                          menuSubItem("Transport", tabName = "trans",icon = icon("car")),
                                                          menuSubItem("Financials", tabName = "fin", icon = icon("suitcase")),
                                                          menuSubItem("Employment", tabName = "empl", icon = icon("glasses")),
                                                          menuSubItem("Communication", tabName = "comm", icon = icon("envelope")),
                                                          menuSubItem("Water Sources", tabName = "water", icon = icon("faucet-drip")),
                                                          menuSubItem("Energy Sources", tabName = "energ", icon = icon("fire")),
                                                          menuSubItem("Religion", tabName = "rel", icon = icon("church")),
                                                          menuSubItem("Hospitality", tabName = "hosp", icon = icon("bed")),
                                                          menuSubItem("Sports", tabName = "sport", icon = icon("basketball"))
                                                 ),
                                                 
                                                 menuItem("Documentation", icon = icon("file"), tabName = "doc", badgeLabel = "New",
                                                          badgeColor = "red")
                                     )
                    ),
                    ## The Body of app page ----  
                    ### Body Items ----
                    dashboardBody(tabItems(
                      tabItem(tabName = "demo", dataTableOutput("mydatatable")),
                      tabItem(tabName = "heal", "Display information about Health"),
                      tabItem(tabName = "educ", "Display information about Education "),
                      tabItem(tabName = "agric","Display information about Agriculure " ),
                      tabItem(tabName = "trans", "Display information about Transport "),
                      tabItem(tabName = "fin", "Display information about Finance "),
                      tabItem(tabName = "empl", "Display information about Employment "),
                      tabItem(tabName = "comm", "Display information about Communication "),
                      tabItem(tabName = "water", "Display information about Water sources "),
                      tabItem(tabName = "energ", "Display information about Energy source "),
                      tabItem(tabName = "rel", "Display information about religion "),
                      tabItem(tabName = "hosp", "Display information about hospitality "),
                      tabItem(tabName = "sport", "Display information about sports "))
                    )
)


