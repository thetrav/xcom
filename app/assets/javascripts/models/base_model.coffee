Page.Models.Base = Backbone.Model.extend(
  url: () ->
    base = "#{@name}s"
    if @isNew()
      base
    else
      "#{base}/#{@id}"
)