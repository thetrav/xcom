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
    $('.item').click((event) => @pickItem(event))
    $('#app .bag').droppable(
      drop : (e) => @bagItem(e)
    )

  pickItem: (event) ->
    $(event.currentTarget).css("background", "red")
    items = new Page.Collections.ItemSelectMenu
    items.fetch(
      success: () -> new Page.Views.ItemSelectMenu(
        collection:items,
        target: $(event.currentTarget).data("id")
      )
      error: () -> new Error(message:"error loading items.")
    )
    false

  bagItem: (event) ->
    bagId = $(event.target).data("id")
    itemId = $(event.srcElement).data("id")
    console.log("drag item "+itemId+"onto "+bagId)
)
