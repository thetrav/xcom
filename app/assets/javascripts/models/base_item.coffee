Page.Models.BaseItem = Backbone.Model.extend(
  url: () ->
    Page.Helpers.url('base_items')
)

Page.Collections.BaseItems = Backbone.Collection.extend(
  model:Page.Models.BaseItem
  url: '/base_items'
)