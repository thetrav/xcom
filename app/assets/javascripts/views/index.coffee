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
    $('#app .bag').droppable(
      drop : (e) =>
        @bagItem(e)
    )

  pickItem: (event) ->
    el = $(event.currentTarget)
    el.css("background", "red")
    slotId = el.closest(".slot").data("id")
    items = new Page.Collections.ItemSelectMenu
    items.fetch(
      success: () ->
        console.log("dislaying select menu")
        new Page.Views.ItemSelectMenu(
          collection:items,
          target: slotId
        )
      error: () -> new Error(message:"error loading items.")
    )
    false

  bagItem: (event) ->
    bagId = $(event.target).data("id")
    itemId = $(event.srcElement).data("id")

    Page.Dispatcher.trigger("Bag:#{bagId}:addItem", itemId)

  unbagItem: (event) ->
    itemId = $(event.currentTarget).data("id")
    item = new Page.Models.Item("id":itemId)
    item.fetch
    item.set("bag_id", "")
    item.save({},
      success: () ->
        Page.routers.inventories.index()
      error: (e) ->
        new Error(e)
    )
    false
)
