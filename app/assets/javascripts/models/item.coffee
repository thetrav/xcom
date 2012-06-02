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
        @view.addItem(model)
      error:(e) ->
        Error.new("error saving item")
    )

  base:(property) ->
    val = @baseItem().get(property)
    if val then val else 0

  baseItem:() ->
    Page.baseItems.get(@get("base_item_id"))

  weight: () ->
    @base("weight")

  space: () ->
    @base("space")

  capacity: () ->
    @base("capacity")


)

Page.Collections.Items = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'

)