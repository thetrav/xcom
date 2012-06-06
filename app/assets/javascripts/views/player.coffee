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
    @el.find(".addItem").click( (e) =>
      new Page.Views.AddItemDialog(target:@model,
      itemsUrl:'/base_items_for_player',
      mountPoint: $(e.currentTarget).data("mount-point")))
    @field("save-loadout").click( (e) =>
      model = new Page.Models.Loadout(player_id: @model.id)
      model.save({},
        success: (e) -> console.log("success")
        error: (e) -> new Error("error saving loadout")
      )
    )

  addItem: (item) ->
    parent = @el.find("#{@field_id(item.get("mount_point"))} > .items")
    item.view = new Page.Views.Item(parent:parent, item:item)
    @updateWeight()

  updateWeight:() ->
    @update("weight", @model.weight())

  updateSpace:() ->
    @update("space", @model.space())
)