# Server file
# May 16th 2020

# Load required packages
library(shiny)
library(tidyverse)
library(ggthemes)
library(lubridate)

# Import data from live source on gov.uk website
covid_import <- read_csv("https://coronavirus.data.gov.uk/downloads/csv/coronavirus-deaths_latest.csv")

# CHange some column names for ease and replace NAs
covid_total  <- covid_import %>%
    mutate(Date        = `Reporting date`,
           Deaths      = replace_na(`Daily change in deaths`, 0),
           Territory   = `Area name`,
           )

# Histogram function
shinyServer(function(input, output) {
    output$covid.plot <- renderPlot({
        
        ## Filter by date then territory
        covid_total <-
            filter(covid_total,
                   Date >= input$date.range[1] & Date <= input$date.range[2]) %>% 
            filter(Territory == input$territory)

        ## Create plot with ggplot - using custom theme
        ggplot(covid_total,
               aes(x = Date, y = Deaths)) +
            geom_bar(stat = "identity", color = "grey", fill = "dark blue") +
            geom_smooth(method = 'loess',
                        se = F, 
                        fullrange = F) +
            theme_fivethirtyeight() +
            scale_x_date()
        
    })
    
})
