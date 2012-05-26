Page.Views.BaseInventoryMenu = Backbone.View.extend(
  initialize: () ->
    @items = @options.collection
    @render()

  render: () ->
    html = JST["templates/baseInventoryMenu"].call(items: @items)
    $(@el).html(html)
    $('#left-menu').html(@el)
    console.log("base inventory view")
)