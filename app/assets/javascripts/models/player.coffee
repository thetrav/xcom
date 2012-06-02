Page.Models.Player = Backbone.Model.extend(
  url: () -> Page.Helpers.url('items')

  addItem:(baseItem) ->
    item = new Page.Models.Item(
      base_item_id:baseItem.id,
      player_id:@id
    )
    item.save({},
      success:(model) =>
        @view.addItem(model)
      error: (e) ->
        new Error("error saving item")
    )
)

Page.Collections.Players = Backbone.Collection.extend(
  model:Page.Models.Player
  url: '/players'
)