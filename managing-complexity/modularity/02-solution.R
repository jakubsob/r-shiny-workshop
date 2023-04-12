library(shiny)
library(ggplot2)

plot_module_ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("plot"))
}

plot_module_server <- function(id, iris_subset, selected_color) {
  moduleServer(id, function(input, output, session) {
    output$plot <- renderPlot({
      ggplot(
        data = iris_subset(),
        aes(
          x = Sepal.Length,
          y = Sepal.Width,
          color = switch(
            selected_color(),
            "Sepal Length" = Sepal.Length,
            "Sepal Width" = Sepal.Width,
            "Petal Length" = Petal.Length,
            "Petal Width" = Petal.Width,
            "Species" = Species
          )
        )
      ) +
        geom_point() +
        labs(color = "Species")
    })
  })
}

table_module_ui <- function(id) {
  ns <- NS(id)
  tableOutput(ns("table"))
}

table_module_server <- function(id, iris_subset) {
  moduleServer(id, function(input, output, session) {
    output$table <- renderTable({
      iris_subset()
    })
  })
}


ui <- fluidPage(
  titlePanel("Iris Dataset"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "species",
        "Species:",
        choices = c("All", unique(as.character(iris$Species))),
        selected = "All"
      ),
      selectInput(
        "color",
        "Color points by:",
        choices = c(
          "Species",
          "Sepal Length",
          "Sepal Width",
          "Petal Length",
          "Petal Width"
        ),
        selected = "Species"
      )
    ),
    mainPanel(
      plot_module_ui("plot"),
      table_module_ui("table")
    )
  )
)

server <- function(input, output) {
  iris_subset <- reactive({
    if(input$species == "All") {
      iris_data <- iris
    } else {
      iris_data <- iris[iris$Species == input$species, ]
    }
    iris_data
  })

  plot_module_server("plot", iris_subset, reactive(input$color))
  table_module_server("table", iris_subset)
}

shinyApp(ui, server)
