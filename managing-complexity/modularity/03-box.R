box::use(
  dplyr[
    filter,
  ],
)

#' @export
filter_column <- function(data, column, values) {
  data %>%
    filter({{ column }} %in% !!values)
}
