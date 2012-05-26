Page.Views.Index = Backbone.View.extend(
  initialize: () ->
    @inventories = @options.collection
    @render()
    Page.Dispatcher.on("index:slot:update", (e) =>
      inventories = new Page.Collections.Inventories
      inventories.fetch(
        success: () -> new Page.Views.Index(collection:inventories)
        error: () -> new Error(message:"error loading inventories.")
      )
    )

  render: () ->
    html = JST["templates/inventories"].call(inventories: @inventories)
    $(@el).html(html)
    $('#app').html(@el)
    $('.item-picker').click((event) => @pickItem(event))
    $('.item').click((event) => @pickItem(event))


  pickItem: (event) ->
    $(event.currentTarget).css("background", "red")
    items = new Page.Collections.ItemSelectMenu
    items.fetch(
      success: () -> new Page.Views.ItemSelectMenu(
        collection:items,
        target: $(event.currentTarget).data("id")
      )
      error: () -> new Error(message:"error loading items.")
    )
    false
)