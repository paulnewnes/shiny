# User Interface file
# May 16th 2020

# Want to swap between different states

# Load required packages
library(shiny)
library(tidyverse)

# Define input and where to put bar chart
shinyUI(
    fluidPage(
    # Application title
        titlePanel("UK Covid-19 Deaths"),
        
    # Date range input
    sidebarLayout(
        
        sidebarPanel(
            ## Panel 1
            h4("Documentation"),
            p("This app shows the daily deaths in the UK from Covid-19"),
            p("Set the date-range & select the UK territory using the controls."),
            p("The Loess regression line will then update."),
            p("The data is imported live from the UK Government website each day.")),
        
        sidebarPanel(
            ## Panel 2
            dateRangeInput(
                "date.range",
                "Date Range",
                min   = as.Date("2020-03-01"),
                start = as.Date("2020-03-01"),
                max   = Sys.Date() - 1,
                end   = Sys.Date() - 1),
            radioButtons(
                "territory",
                label    = "Territory",
                choices  = list("All UK"     = "United Kingdom",
                                "England"    = "England",
                                "Scotland"   = "Scotland",
                                "Wales"      = "Wales",
                                "N. Ireland" = "Northern Ireland"
                                ),
                selected = "United Kingdom",
                inline   = F)
            )
        ), 

    # Generate plot and add notes
    mainPanel(
        plotOutput("covid.plot"),
        p("source: https://coronavirus.data.gov.uk"),
        p("Paul Newnes, May 2020"))
    )
    )
