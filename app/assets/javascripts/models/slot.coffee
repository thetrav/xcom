Page.Models.Slot = Backbone.Model.extend(
  paramRoot: 'slot'

  url: () ->
    base = 'slots'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id

  initialize: () ->
    Page.Dispatcher.on("Slot:#{@get("id")}:ItemSelected", (event) => @itemSelected(event) )

  itemSelected: (item_id) ->
    if @get("item")
      @clearOldItem(item_id)
    else
      @setNewItem(item_id)

  clearOldItem: (item_id) ->
    oldItem = new Page.Models.Item(@get("item"))

    oldItem.set("slot_id", "")
    oldItem.save({},
      success: (e) => @setNewItem(item_id)
      error: (e) => new Error(e)
    )

  setNewItem: (item_id) ->
    if item_id
      newItem = new Page.Models.Item("id": item_id)
      newItem.fetch()
      newItem.set("slot_id", @get("id"))
      newItem.save({},
        success: (e) =>
          Page.reload()
        error: (e) ->
          new Error(e)
      )
    else
      Page.reload()
)