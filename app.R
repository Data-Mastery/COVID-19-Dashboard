library(shiny)
library(dplyr)

server <- function(input, output, session) {
   histogramData <- reactive({
      
    req(input$country)
    print(input$country)
     
    df <- data.frame(a = c(1,2,3,4,5,6,7),
                     b = c(5,6,20,10,30,28,20),
                     c = c(4,20,3,5,20,10,42)
                     ) 
    if(input$country == "Australia") {
      res <- df$a
    } else {
      res <- df$b
    }
    return(res)
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