Page.Views.Player = Page.Views.Base.extend(
  initialize: () ->
    @model = @options.player
    @render()

  render:() ->
    $('#player-tabs').append(JST["templates/player_tab"].call(model : @model, view:this))
    $('#player-content').append(JST["templates/player"].call(model : @model, view:this))
    @bindEl()
    @bindEvents()

  bindEvents: () ->
    @field("controls").find(".addItem").click( (e) =>
      new Page.Views.AddItemDialog(target:@model, itemsUrl:'/base_items_for_player'))

  addItem: (item) ->
    parent = @field("items")
    item.view = new Page.Views.Item(parent:parent, item:item)
    @updateWeight()

  updateWeight:() ->
    @field("weight").text(@model.weight())

)