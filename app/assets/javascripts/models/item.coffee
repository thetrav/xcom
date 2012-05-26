Page.Models.Item = Backbone.Model.extend(
  url: () ->
    base = 'items'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
)

Page.Collections.ItemSelectMenu = Backbone.Collection.extend(
  model:Page.Models.Item
  url: '/items'
)