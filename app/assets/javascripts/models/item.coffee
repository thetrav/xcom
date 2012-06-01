Page.Models.Item = Backbone.Model.extend(
  url: () ->
    base = 'items'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id

  initialize: () ->
    Page.Dispatcher.on("Item:#{@get("id")}:bag", (bagId) => Page.Dispatcher.trigger("Bag:#{bagId}:addItem", this))
    Page.Dispatcher.on("Item:#{@get("id")}:unBag", () => @unBag())

  unBag: () ->
    @set("bag_parent_id", "")
    @save({},
      success: () -> Page.reload()
      error: (e) -> new Error(e)
    )
)

Page.Collections.ItemSelectMenu = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'
)

Page.Collections.BaseInventoryMenu = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'
)