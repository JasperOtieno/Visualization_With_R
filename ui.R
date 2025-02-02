# Script Header ----
# Name: Jasper Otieno
# Title: Shiny Dashboard Project
# Date: 12Dec2023
################################################################################

# Defining the User Interface ----

library(shiny)
library(shinydashboard)
library(rsconnect)
library(fresh)

## The Header bar ----

ui <- dashboardPage(
  skin = "red",
  ### Theme colour for title bar ----
  dashboardHeader(
    title = "VISUALIZATION DASHBOARD",
    ### Title specs ----
    titleWidth = '450px',
    disable = FALSE, #if TRUE title does not display
    
    # ### Dropdown menus ----
    # #### Static Messages ----
    # dropdownMenu(
    #   type = "messages",
    #   badgeStatus = "success",
    #   messageItem(from = "Training Team", message = "Please comnplete all assignments."),
    #   messageItem(from = "New User", message = "Go through the app documentations")
    # ),
    #### Notifications ----
    dropdownMenu(
      type = "notifications",
      badgeStatus = "info",
      
      # notificationItem(
      #   icon = icon("earth"),
      #   status = "info",
      #   text = "2 new countries added this week"
      # ),
      
      notificationItem(
        icon = icon("user", lib = "glyphicon"),
        status = "success",
        text = "Visits"
      )
    )
    # #### Tasks ----
    # dropdownMenu(
    #   type = "warning",
    #   badgeStatus = "info",
    #   taskItem(value = 80, color = "aqua", "Clean data"),
    #   taskItem(value = 60, color = "blue", "Design UI"),
    #   taskItem(value = 30, color = "green","Design server outputs"),
    #   taskItem(value = 10, color = "red", "Write documentation"),
    #   taskItem(value = 0,color = "yellow", "Look for data for the economy sectors")
    # )
  ),
  
  ## The Sidebar for controls ----
  dashboardSidebar(
    disable = FALSE,
    width = '250px',
    collapsed = FALSE,
    
    ### The Search field ----
    sidebarSearchForm(label = "Enter a number or text", "searchText", "searchButton"),
    
    ### Sidebar Items ----
    sidebarMenu(
      id = "tabs",
      collapsed = FALSE,
      
      menuItem(
        "Home",
        startExpanded = TRUE,
        icon = icon("home"),
        tabName = "home",
        menuSubItem("About", tabName = "about", icon = icon("circle-info")),
        menuSubItem("Profile", tabName = "prof", icon = icon("user")),
        menuSubItem("Contacts", tabName = "about", icon = icon("phone"))
      ),
      
      menuItem(
        "Dashboard",
        startExpanded = FALSE,
        tabName = "dashboard",
        icon = icon("dashboard"),
        badgeLabel = "New",
        badgeColor = "green"
      ),
      
      menuItem(
        "Demographics",
        startExpanded = FALSE,
        tabName = "demo",
        icon = icon("people-roof")
      ),
      
      menuItem(
        "Health Sector",
        startExpanded = FALSE,
        tabName = "heal",
        icon = icon("hospital"),
        menuSubItem("STI Dashboard", tabName = "sti_data", icon = icon("bacteria"))
      ),
      
      menuItem(
        "Education Sector",
        startExpanded = FALSE,
        tabName = "educ",
        icon = icon("school")
      ),
      
      menuItem(
        "Agricultural Sector",
        startExpanded = FALSE,
        tabName = "agric",
        icon = icon("tractor")
      ),
      
      menuItem(
        "Transport Sector",
        startExpanded = FALSE,
        tabName = "trans",
        icon = icon("car"),
        menuSubItem("Road Transport", tabName = "roadtr"),
        menuSubItem("Railway Transport", tabName = "railtr"),
        menuSubItem("Air Transport", tabName = "airtr"),
        menuSubItem("Water Transport", tabName = "watertr")
      ),
      
      menuItem(
        "Financials",
        tabName = "fin",
        icon = icon("suitcase")
      ),
      
      menuItem(
        "Communication and Internet",
        startExpanded = FALSE,
        tabName = "comm",
        icon = icon("envelope")
      ),
      
      menuItem(
        "Natural Resources",
        startExpanded = FALSE,
        tabName = "water",
        icon = icon("faucet-drip"),
        menuSubItem("Water sources", tabName = "watersrc"),
        menuSubItem("Forest Cover", tabName = "forestcvr")
      ),
      
      menuItem(
        "Energy Sources",
        startExpanded = FALSE,
        tabName = "energ",
        icon = icon("fire")
      ),
      
      menuItem(
        "Climate Change",
        startExpanded = FALSE,
        tabName = "climate",
        icon = icon("cloud")
      ),
      
      menuItem(
        "Hospitality and Tourism",
        startExpanded = FALSE,
        tabName = "hosp",
        icon = icon("bed")
      ),
      menuItem(
        "Sports & Creative Arts",
        startExpanded = FALSE,
        tabName = "sport",
        icon = icon("basketball")
      )
    )
  ),
  
  ## The Body of app page ----
  ### Body Items ----
  dashboardBody(
    tabItems(
      tabItem(tabName = "demo", "Display information about Demographics "),
      tabItem(tabName = "heal", "Display information about Health "),
      tabItem(tabName = "sti_data",
        h2("STI Data Analysis"),
        fluidRow(column(
          width = 12,
          box(
            title = "box 1",
            status = "primary",
            solidHeader = TRUE,
            "Display content"
          )
        ), column(
          width = 12,
          box(
            title = "box 2",
            status = "success",
            solidHeader = TRUE,
            "Display content"
          )
        ))
      ),
      tabItem(tabName = "educ", "Display information about Education "),
      tabItem(tabName = "agric", "Display information about Agriculure "),
      tabItem(tabName = "trans", "Display information about Transport "),
      tabItem(tabName = "fin", "Display information about Finance "),
      tabItem(tabName = "comm", "Display information about Communication "),
      tabItem(tabName = "water", "Display information about Natural Resources "),
      tabItem(tabName = "energ", "Display information about Energy source "),
      tabItem(tabName = "climate", "Display information about climate change "),
      tabItem(tabName = "hosp", "Display information about hospitality "),
      tabItem(tabName = "sport", "Display information about sports ")
    ),
    
    hr(),
    #Footer
    tags$footer(style = "position: absolute; bottom: 0; left: 0; width:100%; text-align: center; background-colour:blue; padding:10px;", HTML(
      paste("Developed by Jasper Obwaya | &copy;", format(Sys.Date(), "%Y"))
    ))
  )
  
)
