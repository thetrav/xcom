Page.Views.ItemSelectMenu = Backbone.View.extend(
  initialize: () ->
    @items = @options.collection
    @slot = @options.slot
    @render()

  render: () ->
    items = []
    for item in @items.models
      if @slot.accepts(item)
        items.push(item)
    html = JST["templates/itemSelectMenu"].call(items: items)
    $(@el).html(html)
    $('#left-menu').html(@el)
    $('#left-menu .item').click((event) =>
      Page.Dispatcher.trigger("Slot:#{@slot.get("id")}:itemSelected", $(event.currentTarget).data("id"))
    )
)
