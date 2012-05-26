Page.Views.Index = Backbone.View.extend(
  initialize: () ->
    @inventories = @options.collection
    @render()

  render: () ->
    html = JST["templates/inventories"].call(inventories: @inventories)
    $(@el).html(html)
    $('#app').html(@el)
)