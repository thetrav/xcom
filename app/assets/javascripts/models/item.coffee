Page.Models.Item = Backbone.Model.extend(
  url: () ->
    Page.Helpers.url(this, 'items')
)

Page.Collections.Items = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'

)