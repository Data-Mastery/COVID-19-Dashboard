library(shiny)
library(dplyr)
library(tidyr)
library(data.table)

df <- data.table::fread("./COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

globalcolnames <- colnames(df)[5:length(colnames(df))]


df <- df %>%
  select(-c(`Province/State`, Lat, Long)) %>%
  group_by(`Country/Region`) %>%
  summarise_all(list(sum)) %>%
  t() %>%
  as.data.frame()

colnames(df) <- df[1, ]
df <- df[-1, ]
df <- data.frame(lapply(df, as.numeric))



server <- function(input, output, session) {
   histogramData <- reactive({
      
    req(input$country)
    print(input$country)
     
    
    if(input$country %in% colnames(df)) {
      df <- data.frame(
        columns = globalcolnames,
        data = df[, input$country]
      )
      print(df)
      return(df)
      
    } else {
      
    }  
    
   })
   
   observe({
     session$sendCustomMessage("countrydata", histogramData())
   })
}

ui <- function() {
  htmlTemplate("frontend/dist/index.html")
}

# Serve the bundle at js/main.js
if (dir.exists("frontend/dist/js")) {
  addResourcePath("js", "frontend/dist/js")
}

# Serve the bundle at js/main.js
if (dir.exists("frontend/dist/css")) {
  addResourcePath("css", "frontend/dist/css")
}

# Serve the bundle at js/main.js
if (dir.exists("frontend/dist/img")) {
  addResourcePath("img", "frontend/dist/img")
}


shinyApp(ui, server)