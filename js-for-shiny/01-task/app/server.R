function(input, output, session) {
  data <- mtcars |> 
    dplyr::as_tibble(rownames = "model") |>
    arrange(hp)

  output$chart_1 <- renderEcharts4r({
    data |>
      head(5) |>
      e_charts(model) |>
      e_bar(disp)
  })

  output$chart_2 <- renderEcharts4r({
    data |>
      e_charts(model) |>
      e_bar(mpg, stack = "grp") |>
      e_bar(qsec, stack = "grp")
  })
}
