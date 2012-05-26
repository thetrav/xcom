window.Page =
  Views: {},
  Routers: {},
  Models: {},
  Collections: {},
  Dispatcher: _.clone(Backbone.Events)
  init: () ->
    new Page.Collections.Inventories()
    new Page.Routers.Inventories()
    Backbone.history.start()


