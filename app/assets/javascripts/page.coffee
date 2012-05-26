window.Page =
  Views: {},
  Routers: {},
  routers: {},
  Models: {},
  Collections: {},
  Dispatcher: _.clone(Backbone.Events)
  init: () ->
    Page.routers.inventories = new Page.Routers.Inventories()
    Backbone.history.start()