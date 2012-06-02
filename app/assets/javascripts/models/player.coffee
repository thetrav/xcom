Page.Models.Player = Backbone.Model.extend(
  url: () -> Page.Helpers.url('items')

  addItem:(baseItem) ->
    console.log("adding item #{baseItem.id}")
    item = new Page.Models.Item(
      base_item_id:baseItem.id,
      player_id:@id
    )
    item.save()
    @view.addItem(item)
)

Page.Collections.Players = Backbone.Collection.extend(
  model:Page.Models.Player
  url: '/players'
)