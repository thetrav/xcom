Page.Views.AddItemDialog = Backbone.View.extend(
  initialize: () ->
    @target = @options.target
    @mountPoint = @options.mountPoint
    @itemsUrl = @options.itemsUrl
    @render()

  render:() ->
    dialog = $("#dialog")
    dialog.find("#dialog-title").text("Select Item")
    body = dialog.find(".modal-body")
    body.html('<input class="filter" id="filter-field" type="text"/><ul class="items"></ul>')
    dialog.on('shown', () -> $('#filter-field').focus())
    dialog.modal('show')
    @loadItems()

  loadItems: () ->
    baseItems = new Backbone.Collection
    baseItems.model = Page.Models.BaseItem
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

    list = body.find(".items")
    for baseItem in baseItems.models
      list.append(JST["templates/select_item"].call(baseItem:baseItem))
    list.find("li").click((e) =>
      itemId = $(e.currentTarget).data("id")
      baseItem = baseItems.get(itemId)
      @target.addItem(baseItem, @mountPoint)
      $("#dialog").modal("hide")
    )
    Page.listFilter(body.find(".filter"), list)
    body.find("#filter-field")

)