Page.Models.Loadout = Page.Models.Base.extend(
  initialize:() ->
    @name = "loadout"
)

Page.Collections.Loadouts = Backbone.Collection.extend(
  model:Page.Models.Loadout
  url: '/loadouts'
)