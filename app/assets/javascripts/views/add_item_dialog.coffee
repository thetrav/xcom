Page.Views.AddItemDialog = Backbone.View.extend(
  initialize: () ->
    @target = @options.target
    @itemsUrl = @options.itemsUrl
    @render()

  render:() ->
    console.log("add item")
    dialog = $("#dialog")
    body = dialog.find(".modal-body")
    body.html("<p>Loading Items...</p>")
    dialog.modal('show')
    @loadItems()

  loadItems: () ->
    baseItems = new Backbone.Collection
    baseItems.url = @itemsUrl
    baseItems.fetch(
      success: () =>
        @itemsLoaded(baseItems)
      error: (e) =>
        Error("Error loading items.")
        dialog.modal('hide')
    )

  itemsLoaded:(baseItems) ->
    body = $("#dialog .modal-body")
    body.html('<input class="filter" type="text"/><ul class="items"></ul>')

    list = body.find(".items")
    for baseItem in baseItems.models
      list.append(JST["templates/select_item"].call(baseItem:baseItem))
    list.find("li").click((e) =>
      itemId = $(e.currentTarget).data("id")
      @target.addItem(baseItems.get(itemId))
      $("#dialog").modal("hide")
    )
    Page.listFilter(body.find(".filter"), list)

)