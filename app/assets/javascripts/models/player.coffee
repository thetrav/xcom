Page.Models.Player = Page.Models.Base.extend(
  initialize:() ->
    @name = "player"

  addItem:(baseItem) ->
    item = new Page.Models.Item(
      base_item_id:baseItem.id,
      player_id:@id
    )
    item.save({},
      success:(model) =>
        Page.items.add(model)
        @view.addItem(model)
      error: (e) ->
        new Error("error saving item")
    )

  items: () ->
    Page.items.where(player_id: @id)

  weight: () ->
    @items().reduce(((x,c) -> x + c.weight()), 0)

  space: () ->
    @items().reduce(((x,c) -> x + c.space()), 0)
)

Page.Collections.Players = Backbone.Collection.extend(
  model:Page.Models.Player
  url: '/players'
)