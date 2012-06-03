Page.Models.BaseItem = Page.Models.Base.extend(
  initialize: () ->
    @name = 'base_item'
)

Page.Collections.BaseItems = Backbone.Collection.extend(
  model:Page.Models.BaseItem
  url: '/base_items'
)