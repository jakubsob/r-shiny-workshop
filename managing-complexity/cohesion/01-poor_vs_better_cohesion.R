PoorCohesion <- R6::R6Class(
  "PoorCohesion",
  private = list(
    a = NULL,
    b = NULL,
  ),
  public = list(
    initialize = function() {
      private$a = 0
      private$b = 0
    },
    process_a = function(x) {
      private$a <- a + x
    },
    process_b = function(x) {
      private$b <- a + x
    }
  )
)

BetterCohesionA <- R6::R6Class(
  "BetterCohesionA",
  private = list(
    a = NULL
  ),
  public = list(
    initialize = function() {
      private$a = 0
    },
    process_a = function(x) {
      private$a <- a + x
    }
  )
)

BetterCohesionB <- R6::R6Class(
  "BetterCohesionB",
  private = list(
    b = NULL
  ),
  public = list(
    initialize = function() {
      private$b = 0
    },
    process_b = function(x) {
      private$b <- b + x
    }
  )
)

