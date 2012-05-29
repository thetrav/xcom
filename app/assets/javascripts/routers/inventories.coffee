Page.Routers.Inventories = Backbone.Router.extend(
  routes:
    "" : "index"

  index: () ->
    players = new Page.Collections.Players
    players.fetch(
      success: () -> new Page.Views.Index(collection:players)
      error: () -> new Error(message:"error loading players.")
    )

    items = new Page.Collections.BaseInventoryMenu
    items.fetch(
      success: () -> new Page.Views.BaseInventoryMenu(collection:items)
      error: () -> new Error(message:"error loading items.")
    )
)