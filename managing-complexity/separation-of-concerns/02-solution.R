Shop <- R6::R6Class(
  classname = "Shop",
  private = list(
    cart = NULL,
    store = NULL
  ),
  public = list(
    initialize = function(cart, store) {
      private$cart <- cart
      private$store <- store
    },
    add_to_cart = function(item) {
      # Essential complexity only
      private$cart$add(item)
      private$store$store_item(item)
      self$calculate_cart_total()
    },
    calculate_cart_total = function() {

    }
  )
)

cart <- list(
  add = function(item) {

  }
)

item <- list(
  name = "Item 1",
  price = 20
)

# Store object is responsible for managing database logic.
# It hides implementation from Shop object.
store <- list(
  store_item = function(item) {
    con <- DBI::dbConnect(RSQLite::SQLite(), "db.sqlite")
    if (!DBI::dbExistsTable(con, "cart")) {
      DBI::dbCreateTable(con, "cart", data.frame(name = character(), price = numeric()))
    }
    DBI::dbAppendTable(
      con,
      "cart",
      data.frame(
        name = item$name,
        price = item$price
      )
    )
    DBI::dbDisconnect(con)
  }
)

shop <- Shop$new(cart, store)
shop$add_to_cart(item)
