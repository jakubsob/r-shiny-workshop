# Identify how this app could be split into smaller pieces:
# - which pieces of functionality could be reused in other features or apps?
# - which parts could be self-contained?
# - which parts we could test in isolation?
# There is more than one answer!

library(shiny)
library(ggplot2)

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
      plotOutput("plot"),
      tableOutput("table")
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

  output$plot <- renderPlot({
    ggplot(
      data = iris_subset(),
      aes(
        x = Sepal.Length,
        y = Sepal.Width,
        color = switch(
          input$color,
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

  output$table <- renderTable({
    iris_subset()
  })
}

shinyApp(ui, server)
