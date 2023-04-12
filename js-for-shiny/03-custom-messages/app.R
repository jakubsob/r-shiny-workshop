library(shiny)

ui <- fluidPage(
  tags$script("
    const updateInnerHtml = function(options) {
      const element = document.getElementById(options.id);
      element.innerHTML = options.value;
    };
    Shiny.addCustomMessageHandler('updateInnerHtml', updateInnerHtml);
  "
  ),
  textInput(inputId = "text", label = "Text input"),
  div(id = "target")
)

server <- function(input, output, session) {
  observeEvent(input$text, {
    session$sendCustomMessage("updateInnerHtml", list(id = "target", value = input$text))
  })
}

shinyApp(ui, server)
