Page.Routers.Inventories = Backbone.Router.extend(
  routes:
    "inventories/id" : "edit"
    "" : "index"
    "new" : "newInventory"

  edit: (id) ->
    inventory = new Inventory(id : id)
    inventory.fetch(
      success: (model, resp) ->
        new Page.Views.Edit(model:inventory)
    )

  index: () ->
    console.log("inventory route followed")
    inventories = new Page.Collections.Inventories
    inventories.fetch(
      success: () -> new Page.Views.Index(collection:inventories)
      error: () -> new Error(message:"error loading inventories.")
    )

  newInventory:() -> new Page.Views.Edit(model: new Inventory())
)