# Create a button that will make a plot go to fullscreen
# Use www/js/main.js file to add JS function
# Use document.getElementById function to select element that should go to fullscreen
fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/main.css"),
    tags$script(src = "js/main.js"),
  ),
  div(
    class = "page",
    div(
      class = "content",
      "Just some normal content div.",
      tags$hr(),
      echarts4rOutput("chart_1")
    ),
    div(
      class = "content",
      id = "full",
      tags$b("This div can be in your entire screen."),
      tags$hr(),
      echarts4rOutput("chart_2")
    )
  )
)
