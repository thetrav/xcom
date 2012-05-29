Page.Models.Bag = Backbone.Model.extend(
  url: () ->
    base = 'bags'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
)