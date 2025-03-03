# Script Header ----
# Name: Jasper Otieno
# Title: Shiny Dashboard Project
# Date: 12Dec2023
################################################################################

# Defining the User Interface ----

source("./Scripts/install_packages.R")


## The Header bar ----

ui <- dashboardPage(
  skin = "blue",
  
  dashboardHeader(
    title = "MULTI-SECTORAL DASHBOARD",
    
    ### Title specs ----
    titleWidth = '450px',
    disable = FALSE,
    #if TRUE title does not display
    
    #### Notifications ----
    dropdownMenu(
      type = "notifications",
      badgeStatus = "info",
      notificationItem(
        icon = icon("user", lib = "glyphicon"),
        status = "success",
        text = "Visits"
      )
    )
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
        menuSubItem(
          "STI Analysis Dashboard",
          tabName = "sti_data",
          icon = icon("bacteria")
        )
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
      tabItem(tabName = "heal"),
      tabItem(
        tabName = "sti_data",
        #h2("STI Analysis Dashboard"),
        fluidRow(
          column(
            width = 2,
            box(
              title = "Filters",
              status = "primary",
              solidHeader = TRUE,
              width = NULL,
              #height = "300px", 
              selectInput("sti_status", "STI Status", choices = NULL),
              selectInput("gender", "Gender", choices = NULL),
              sliderInput(
                "subjects_age",
                "Age Range",
                min = 15,
                max = 100,
                value = c(15, 30)
              ),
              checkboxGroupInput("level_of_education", "Education Level", choices = NULL),
              checkboxGroupInput("marital_status", "Marital Status", choices = NULL)
              #actionButton("apply_filters", "Apply Filters", icon = icon("filter"))
            )
          ),
          column(
            width = 5,
            box(
              title = "Age Distribution",
              status = "warning",
              solidHeader = TRUE,
              width = NULL,
              height = "300px", 
              plotOutput("age_distribution_plot")
            ),
            box(
              title = "STI Types",
              status = "info",
              solidHeader = TRUE,
              width = NULL,
              height = "300px", 
              plotOutput("sti_type_plot")
            )
          ),
          column(
            width = 5,
            box(
              title = "STI Prevalence by Gender",
              status = "success",
              solidHeader = TRUE,
              width = NULL,
              height = "300px", 
              plotOutput("sti_gender_plot")
            ),
            box(
              title = "Summary Statistics",
              status = "danger",
              solidHeader = TRUE,
              width = NULL,
              height = "300px", 
              tableOutput("summary_table")
            )
          )
        )
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
