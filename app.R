library(shiny)

server <- function(input, output, session) {
  # histogramData <- reactive({
  #   if(is.null(input$datainput)) {
  #     row = "mpg"
  #   } else {
  #     row = input$datainput
  #   }
  #   print(input$tooltiphighcharts)
  #   mtcars[row]
  # })
  # 
  # observe({
  #   session$sendCustomMessage("histogramData", histogramData())
  # })
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