Page.Models.Slot = Backbone.Model.extend(
  url: () ->
    base = 'slots'
    if this.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + this.id
)