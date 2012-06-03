Page.Models.Item = Backbone.Model.extend(
  url: () ->
    Page.Helpers.url(this, 'items')

  addItem:(baseItem) ->
    console.log("adding item #{baseItem.id}")
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
    @base("weight") + @childrenWeight().weight()

  childrenWeight:() ->
    @children().reduce(
      ((a,b) => weight: () => a.weight() + b.weight()),
      weight:() -> 0)


  space: () ->
    @base("space")

  capacity: () ->
    @base("capacity")


)

Page.Collections.Items = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'

)