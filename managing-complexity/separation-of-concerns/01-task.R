# Take a look at the Shop object and how it uses `cart` object.
# Can you separate which parts of the code don't belong in the `add_to_cart` method?
# Think about:
# - what would you do if you needed to swap SQLite with other storage
# - what details about the database Shop object needs to know

Shop <- R6::R6Class(
  classname = "Shop",
  private = list(
    cart = NULL
  ),
  public = list(
    # We create a shop with a cart to which we can add items
    initialize = function(cart) {
      private$cart <- cart
    },
    # This method adds item to cart and stores item in a database
    add_to_cart = function(item) {
      private$cart$add(item)

      con <- DBI::dbConnect(RSQLite::SQLite(), "db.sqlite")

      if (!DBI::dbExistsTable(con, "cart")) {
        DBI::dbCreateTable(
          con,
          "cart",
          data.frame(name = character(), price = numeric())
        )
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

      self$calculate_cart_total()
    },
    calculate_cart_total = function() {

    }
  )
)

# A dummy cart object that has an `add` function that mocks actual behavior
cart <- list(
  add = function(item) {

  }
)

item <- list(
  name = "Item 1",
  price = 20
)

shop <- Shop$new(cart)
shop$add_to_cart(item)
