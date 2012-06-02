Page.Helpers = {
  url: (model, name) ->
    base = name
    if model.isNew()
      base
    else
      base + (if base.charAt(base.length - 1) == '/' then '' else '/') + model.id
}