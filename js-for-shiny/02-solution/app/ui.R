# Based on:
# https://stackoverflow.com/questions/61128930/button-to-view-in-full-screen

fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/main.css"),
    tags$script(src = "js/main.js"),
  ),
  div(
    class = "page",
    actionButton(
      "fs",
      "Full screen button",
      onclick = "openFullscreen(document.getElementById('full'));"
    ),
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
