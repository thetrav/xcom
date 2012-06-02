Page.Models.Item = Backbone.Model.extend(
  url: () ->
    Page.Helpers.url(this, 'items')

  addItem:(baseItem) ->
    console.log("adding item #{baseItem.id}")
    item = new Page.Models.Item(
      base_item_id:baseItem.id,
      parent_item_id:@id
    )
    item.save()
    @view.addItem(item)
)

Page.Collections.Items = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'

)