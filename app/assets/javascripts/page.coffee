window.Page =
  Views: {},
  Models: {},
  Collections: {},
  Dispatcher: _.clone(Backbone.Events)
  init: () ->
    console.log("clearing dispatcher")
    Page.Dispatcher.off()
    Page.players = new Page.Collections.Players
    Page.players.fetch(
      success: () =>
        Page.baseItems = new Page.Collections.BaseItems
        Page.baseItems.fetch(
          success: () =>
            Page.items = new Page.Collections.Items
            Page.items.fetch(
              success: () =>
                @renderPlayers()
                $('ul.nav-tabs a:first').tab('show');
                @renderItems()
                @loadLoadouts()
              error: () -> new Error(message:"error loading items.")
            )
          error: () -> new Error(message:"error loading base items.")
        )
      error: () -> new Error(message:"error loading players.")
    )

  loadLoadouts: () ->
    Page.loadouts = new Page.Collections.Loadouts
    Page.loadouts.fetch(
      success: () =>
        @renderLoadouts()
      error: () -> new Error(message:"error loading loadouts")
    )

  renderLoadouts: () ->
    for loadout in Page.loadouts.models
      player = Page.players.get(loadout.get("player_id"))
      if(player)
        player.view.addLoadout(loadout)
#      else
#        debugger

  renderPlayers: () ->
    for player in Page.players.models
      player.view = new Page.Views.Player(player:player)

  renderItems: () ->
    for player in Page.players.models
      for item in Page.items.where(player_id : player.id)
        player.view.addItem(item)

  listFilter:(input, list) ->
    input.change(() =>
      console.log("input changed")
      filter = input.val().toLowerCase()
      list.find(".aliases:not(:contains('#{filter}'))").parent().slideUp()
      list.find(".aliases:contains('#{filter}')").parent().slideDown()
    )
    input.keyup(() ->
      console.log("keyup")
      input.change()
    )
