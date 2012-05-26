Page.Models.Inventory = Backbone.Model.extend(
  url: () ->
    base = 'inventories'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
)

Page.Collections.Inventories = Backbone.Collection.extend(
  model:Page.Models.Inventory
  url: '/inventories'
)