Page.Models.Player = Backbone.Model.extend(
  url: () ->
    base = 'players'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
)

Page.Collections.Players = Backbone.Collection.extend(
  model:Page.Models.Player
  url: '/players'
)