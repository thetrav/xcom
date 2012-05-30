Page.Models.Slot = Backbone.Model.extend(
  paramRoot: 'slot'

  url: () ->
    base = 'slots'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id

  initialize: () ->
    pickEvent = "Slot:#{@get("id")}:pickItem"
    Page.Dispatcher.on(pickEvent, (event) => @pickItem(event) )
    Page.Dispatcher.on("Slot:#{@get("id")}:itemSelected", (event) => @itemSelected(event) )

  pickItem: (event) ->
    el = $(event.currentTarget)
    el.css("background", "red")
    items = new Page.Collections.ItemSelectMenu
    items.fetch(
      success: () =>
        new Page.Views.ItemSelectMenu(
          collection:items,
          slot: this
        )
      error: () -> new Error(message:"error loading items.")
    )
    false

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

  accepts: (item) ->
    if @get("accepts")
      for accept in @get("accepts")
        if accept == item.get("name")
          return true
        if item.get("aliases")
          for alias in item.get("aliases")
            if accept == alias
              return true
)