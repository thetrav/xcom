Page.Models.Item = Page.Models.Base.extend(
  initialize:() ->
    @name = 'item'

  addItem:(baseItem) ->
    item = new Page.Models.Item(
      base_item_id:baseItem.id,
      parent_item_id:@id
    )
    item.save({},
      success:(model) =>
        Page.items.add(model)
        @view.addItem(model)
      error:(e) ->
        Error.new("error saving item")
    )

  base:(property) ->
    val = @baseItem().get(property)
    if val then val else 0

  baseItem:() ->
    Page.baseItems.get(@get("base_item_id"))

  parent:() ->
    parentItem = @get("parent_item_id")
    if parentItem
      Page.items.where(id:parentItem)[0]
    else
      Page.players.where(id:@get("player_id"))[0]

  children:() ->
    Page.items.where(parent_item_id: @id)

  weight: () ->
    @base("weight") + @childrenWeight()

  childrenWeight:() ->
    @children().reduce(((x,c) -> x + c.weight()), 0)

  label: () ->
    @base("name")

  space: () ->
    @base("space") + @childrenSpace()

  childrenSpace:() ->
    @children().reduce(((x,c) -> x + c.space()), 0)

  capacity: () ->
    @base("capacity")

  trash: (callbacks) ->
    @save({trashed: true},
    success:(model) ->
      Page.items.remove(model)
      callbacks.success(model)
    error:(e) ->
      callbacks.error(e)
    )
)

Page.Collections.Items = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'

)