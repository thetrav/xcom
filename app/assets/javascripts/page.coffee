window.Page =
  Views: {},
  Routers: {},
  Models: {},
  Collections: {},
  init: () ->
    new Page.Collections.Inventories()
    new Page.Routers.Inventories()
    Backbone.history.start()
    console.log("inited")


