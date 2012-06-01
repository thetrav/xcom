Page.Models.Bag = Backbone.Model.extend(
  url: () ->
    base = 'bags'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
  initialize: () ->
    Page.Dispatcher.on("Bag:#{@id}:addItem", (e) => @addItem(e))

  addItem: (item) ->
    if @accepts(item)
      item = new Page.Models.Item("id":item.id)
      item.fetch
      item.set("bag_parent_id", @id)
      item.save({},
        success: () =>
          Page.reload()
        error: (e) =>
          new Error(e)
      )
    else
      Page.reload()

  accepts: (item) ->
    if @get("accepts")
      for accept in @get("accepts")
        if accept == item.get("name") or accept == "all"
          return true
        if item.get("aliases")
          for alias in item.get("aliases")
            if accept == alias
              return true
)