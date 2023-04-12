A <- R6::R6Class(
  "A",
  private = list(
    a = NULL
  ),
  public = list(
    initialize = function() {
      private$a = 0
    },
    process = function(x) {
      private$a <- a + x
    }
  )
)
