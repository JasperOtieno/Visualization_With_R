# Script Header ----
# Name: Jasper Otieno                                                                   #
# Title: Shiny Dashboard Project                                                        #
# Date: 12Dec2023                                                                       #
#########################################################################################

# Load the dataset
sti_data <- read.xlsx("./Data/STIData_Cleaned.xlsx", colNames = TRUE)

# Server output ----
server <- function(input, output, session) {
  
  # Dynamically update filter choices
  observe({
    updateSelectInput(session, "sti_status", choices = c("All", unique(sti_data$sti_status)))
    updateSelectInput(session, "gender", choices = c("All", unique(sti_data$gender)))
    updateCheckboxGroupInput(session, "level_of_education", choices = unique(sti_data$level_of_education))
    updateCheckboxGroupInput(session, "marital_status", choices = unique(sti_data$marital_status))
  })
  
  # Reactive Data Filtering
  filtered_data <- reactive({
    data <- sti_data
    
    # Apply Filters
    if (input$sti_status != "All") {
      data <- data %>% filter(sti_status == input$sti_status)
    }
    
    if (input$gender != "All") {
      data <- data %>% filter(gender == input$gender)
    }
    
    if (!is.null(input$level_of_education)) {
      data <- data %>% filter(level_of_education %in% input$level_of_education)
    }
    
    if (!is.null(input$marital_status)) {
      data <- data %>% filter(marital_status %in% input$marital_status)
    }
    
    data <- data %>% filter(subjects_age >= input$subjects_age[1] & subjects_age <= input$subjects_age[2])
    
    data
  })
  
  # STI Prevalence by Gender (Bar Chart with Tooltips)
  output$sti_gender_plot <- renderPlotly({
    data <- filtered_data()
    
    # Check if data is empty
    if (nrow(data) == 0) {
      return(NULL)  # Return nothing if data is empty
    }
    
    # Remove NA values and group data
    data <- data %>%
      drop_na(gender, sti_status) %>%  # Remove rows with NA values
      group_by(gender, sti_status) %>%  # Group by gender and sti_status
      dplyr::summarise(count = n(), .groups = 'drop')  # Summarize and drop grouping
    

    # Create the plot
    p <- ggplot(data, aes(x = gender, y = count, fill = sti_status, text = paste("Gender:", gender, "<br>Count:", count))) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(title = "STI Prevalence by Gender", x = "Gender", y = "Count") +
      theme_minimal()
    
    ggplotly(p, tooltip = "text")
  })
  
  # Age Distribution (Histogram with Drill-Down)
  output$age_distribution_plot <- renderPlotly({
    data <- filtered_data()
    
    # Check if data is empty
    if (nrow(data) == 0) {
      return(NULL)  # Return nothing if data is empty
    }
    
    # Create the plot
    p <- ggplot(data, aes(x = subjects_age, text = paste("Age:", subjects_age))) +
      geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
      labs(title = "Age Distribution", x = "Age", y = "Count") +
      theme_minimal()
    
    ggplotly(p, tooltip = "text") %>%
      event_register("plotly_click")
  })
  
  # Drill-Down Table for Age Distribution
  output$drilldown_table <- renderTable({
    event_data <- event_data("plotly_click", source = "age_distribution_plot")
    if (is.null(event_data)) return(NULL)
    
    age_range <- event_data$x
    data <- filtered_data() %>%
      filter(subjects_age >= age_range - 2.5 & subjects_age <= age_range + 2.5)
    
    data
  })
  
  # STI Types (Pie Chart with Tooltips)
  output$sti_type_plot <- renderPlotly({
    data <- filtered_data()
    
    # Check if data is empty
    if (nrow(data) == 0) {
      return(NULL)  # Return nothing if data is empty
    }
    
    # Filter for positive STI status and remove NA values
    data <- data %>%
      filter(sti_status == "Positive") %>%
      drop_na(Typeofsti) %>%  # Remove rows with NA values
      group_by(Typeofsti) %>%
      dplyr::summarise(count = n(), .groups = 'drop')  # Summarize and drop grouping
    

    # Create the plot
    p <- ggplot(data, aes(x = "", y = count, fill = Typeofsti, text = paste("STI Type:", Typeofsti, "<br>Count:", count))) +
      geom_bar(stat = "identity", width = 1) +
      coord_polar("y", start = 0) +
      labs(title = "Distribution of STI Types", fill = "STI Type") +
      theme_void()
    
    ggplotly(p, tooltip = "text")
  })
  
  # Summary Statistics Table
  output$summary_table <- renderTable({
    data <- filtered_data()
    
    # Check if data is empty
    if (nrow(data) == 0) {
      return(NULL)  # Return nothing if data is empty
    }
    
    # Calculate summary statistics
    summary <- data %>%
      summarise(
        `Average Age` = mean(subjects_age, na.rm = TRUE),
        `Average Weight` = mean(weight, na.rm = TRUE),
        `Average Height` = mean(height, na.rm = TRUE),
        `Average BMI` = mean(bmi, na.rm = TRUE)
      )

    summary
  })
}