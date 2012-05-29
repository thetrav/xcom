Page.Models.Bag = Backbone.Model.extend(
  url: () ->
    base = 'bags'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
  initialize: () ->
    Page.Dispatcher.on("Bag:#{@get("id")}:addItem", (e) => @addItem(e))

  addItem: (item_id) ->
    console.log("saving item")
    item = new Page.Models.Item("id":item_id)
    item.fetch
    item.set("bag_id", @get("id"))
    item.save({},
      success: () =>
        Page.routers.inventories.index()
      error: (e) =>
        new Error(e)
    )
)