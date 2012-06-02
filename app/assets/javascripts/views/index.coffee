Page.Views.Index = Backbone.View.extend(
  initialize: () ->
    @players = @options.collection
    @render()

  render: () ->
    html = ""
    html += JST["templates/players"].call(players : @players.models)
    $(@el).html(html)
    $('#app').html(@el)
    $('ul.nav-tabs a:first').tab('show');
    $('.item-picker').click((event) => @pickItem(event))
    $('.slot > .item > .item-label > .icons > #drop').click((event) => @pickItem(event))
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
