library(plotly)
library(shiny)

df <- read.csv("https://raw.githubusercontent.com/algorithmartisan04/Forest-Fires-in-Riverside-County-California/682e9c93c012a7af548573b7e36b2b3dbb1e4ad5/Cali_Fire_Cleaned.csv")

## OVERVIEW TAB INFO
overview_tab <- tabPanel("Introduction and Overview",
                         h1("Forest Fires Analysis in California"),
                         p("Explore factors influencing the severity of forest fires and their impact on lives, property, ecosystems, and climate.")
)

## VIZ 1 TAB INFO
viz_1_sidebar <- sidebarPanel(
  h2("Causation"),
  sliderInput(
    inputId = "cause_selection",
    label = "Cause",
    min = 1,
    max = 19,
    value = c(1, 19),
    sep = ""
  )
)

viz_1_main_panel <- mainPanel(
  h2("Causation of the fire"),
  plotOutput(outputId = "forest_plot1")
)

viz_1_tab <- tabPanel("Cause Analysis",
                      sidebarLayout(
                        viz_1_sidebar,
                        viz_1_main_panel
                      )
)

## VIZ 2 TAB INFO
viz_2_sidebar <- sidebarPanel(
  h2("Severity"),
  sliderInput(
    inputId = "severity_selection",
    label = "GIS_ACRES",
    min = 1,
    max = 100,
    value = c(1, 100),
    sep = ""
  )
)

viz_2_main_panel <- mainPanel(
  h2("Severity Level"),
  plotOutput(outputId = "forest_plot2")
)

viz_2_tab <- tabPanel("Severity Analysis",
                      sidebarLayout(
                        viz_2_sidebar,
                        viz_2_main_panel
                      )
)

## VIZ 3 TAB INFO
viz_3_sidebar <- sidebarPanel(
  h2("Collection Methods"),
  sliderInput(
    inputId = "method_selection",
    label = "C_METHOD",
    min = 1,
    max = 8,
    value = c(1, 8),
    sep = ""
  )
)

viz_3_main_panel <- mainPanel(
  h2("Collection Methods which respond to quickest"),
  plotOutput(outputId = "forest_plot3")
)

viz_3_tab <- tabPanel("Quick Response Analysis",
                      sidebarLayout(
                        viz_3_sidebar,
                        viz_3_main_panel
                      )
)

## CONCLUSIONS TAB INFO
conclusion_tab <- tabPanel("Conclusion",
                           h1("Key Takeaways"),
                           h3("Takeaway 1: Causation of Fires"),
                           p("The analysis of fire causes reveals that certain factors, represented by the selected variable in Viz 1, have a significant impact on the occurrence and severity of fires in Riverside County, California.
                             (Note: Here is the key corresponding to each numbers: 
                             1- Lightning, 2- Equipment Use, 3- Smoking, 4- Campfire, 5- Debris,
                             6- Hands Drawn, 7- Arson, 8- Playing with fire, 9- Miscellaneous, 
                             10- Vehicle, 11- Powerline, 12- Firefighter Training, 13- Non firefighter training,
                             14- Unknown, 15- Structure, 16- Aircraft, 17- N/A, 18- Escaped Prescribed Burn,
                             19- Illegal Alien Campfire)"),
                           h3("Takeaway 2: Severity and Acres Burnt"),
                           p("Viz 2 illustrates a correlation between the severity of fires and the amount of acres burnt. As severity increases, the extent of damage to the ecosystem, property, and lives is also observed to rise."),
                           h3("Takeaway 3: Collection Method Comparison"),
                           p("By examining Viz 3, we discern insights into the effectiveness of different collection methods in responding to fires. This analysis helps identify methods that result in quicker response times and lower damage, as indicated by the selected variables.")
)

ui <- navbarPage("Forest Fire in CA",
                 overview_tab,
                 viz_1_tab,
                 viz_2_tab,
                 viz_3_tab,
                 conclusion_tab
)