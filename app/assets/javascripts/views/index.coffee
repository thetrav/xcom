Page.Views.Index = Backbone.View.extend(
  initialize: () ->
    @players = @options.collection
    @render()

  render: () ->
    html = ""
    for player in @players.models
      html += JST["templates/player"].call(player: new Page.Models.Player(player))
    $(@el).html(html)
    $('#app').html(@el)
    $('.item-picker').click((event) => @pickItem(event))
    $('.slot > .item').click((event) => @pickItem(event))
    $('.bag > .item').click((event) => @unbagItem(event))
    $('#app .bag').droppable( drop : (e) => @bagItem(e) )

  pickItem: (event) ->
    slotId = $(event.currentTarget).closest(".slot").data("id")
    trigger = "Slot:#{slotId}:pickItem"
    Page.Dispatcher.trigger(trigger, event)
    false

  bagItem: (event) ->
    bagId = $(event.target).data("id")
    itemId = $(event.srcElement).data("id")

    Page.Dispatcher.trigger("Item:#{itemId}:bag", bagId)
    false

  unbagItem: (event) ->
    itemId = $(event.currentTarget).data("id")
    Page.Dispatcher.trigger("Item:#{itemId}:unBag")
    false
)
