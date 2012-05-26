Page.Routers.Inventories = Backbone.Router.extend(
  routes:
    "" : "index"

  index: () ->
    console.log("index")
    inventories = new Page.Collections.Inventories
    inventories.fetch(
      success: () -> new Page.Views.Index(collection:inventories)
      error: () -> new Error(message:"error loading inventories.")
    )

    items = new Page.Collections.BaseInventoryMenu
    items.fetch(
      success: () -> new Page.Views.BaseInventoryMenu(collection:items)
      error: () -> new Error(message:"error loading items.")
    )
)