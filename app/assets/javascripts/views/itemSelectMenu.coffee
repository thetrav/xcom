Page.Views.ItemSelectMenu = Backbone.View.extend(
  initialize: () ->
    @items = @options.collection
    @target = @options.target
    @render()

  render: () ->
    html = JST["templates/itemSelectMenu"].call(items: @items)
    $(@el).html(html)
    $('#left-menu').html(@el)
    $('#left-menu .item').click((event) =>
      Page.Dispatcher.trigger("Slot:#{@target}:ItemSelected", $(event.currentTarget).data("id")))
)
