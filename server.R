library(ggplot2)
library(dplyr)
library(shiny)

df <- read.csv("https://raw.githubusercontent.com/algorithmartisan04/Forest-Fires-in-Riverside-County-California/682e9c93c012a7af548573b7e36b2b3dbb1e4ad5/Cali_Fire_Cleaned.csv")

server <- function(input, output) {
  output$forest_plot1 <- renderPlot({
    req(input$cause_selection)
    filtered_df <- df %>%
      filter(between(CAUSE, input$cause_selection[1], input$cause_selection[2]))
    
    ggplot(data = filtered_df, aes(x = GIS_ACRES, y = CAUSE, color = C_METHOD)) +
      geom_point()
  })
  
  output$forest_plot2 <- renderPlot({
    req(input$severity_selection)
    filtered_df <- df %>%
      filter(between(GIS_ACRES, input$severity_selection[1], input$severity_selection[2]))
    
    ggplot(data = filtered_df, aes(x = GIS_ACRES, y = CAUSE, color = C_METHOD)) +
      geom_point()
  })
  
  output$forest_plot3 <- renderPlot({
    req(input$method_selection)
    filtered_df <- df %>%
      filter(between(C_METHOD, input$method_selection[1], input$method_selection[2]))
    
    ggplot(data = filtered_df, aes(x = GIS_ACRES, y = CAUSE, color = C_METHOD)) +
      geom_point()
  })
}

shinyApp(ui = ui, server = server)