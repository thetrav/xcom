Page.Views.ItemSelectMenu = Backbone.View.extend(
  initialize: () ->
    @items = @options.collection
    @target = @options.target
    @render()

  render: () ->
    html = JST["templates/itemSelectMenu"].call(items: @items)
    $(@el).html(html)
    $('#left-menu').html(@el)
    $('#left-menu .item').click((event) => @itemSelected(event))

  itemSelected: (event) ->
    item_id = $(event.currentTarget).data("id")
    new Page.Models.Slot(id: @target).save({item_id: item_id}, {
      success: (e) ->
        Page.routers.inventories.index()
    })
)
