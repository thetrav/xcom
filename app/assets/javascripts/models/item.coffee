Page.Models.Item = Backbone.Model.extend(
  url: () ->
    base = 'items'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
)