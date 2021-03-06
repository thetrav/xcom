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
      mountpoint = $(e.currentTarget).data("mount-point")
      new Page.Views.AddItemDialog(
        target: @model,
        itemsUrl: "/base_items_for_player?mountpoint=#{mountpoint}",
        mountPoint: mountpoint)
    )
    @field("save-loadout").click( (e) => @saveLoadoutDialog())

  saveLoadoutDialog:() ->
    dialog = $("#dialog")
    dialog.find("#dialog-title").text("Name Loadout")
    body = dialog.find(".modal-body")
    body.html("<input id='loadout-name'/><div class='btn btn-primary' id='save-loadout-buton'>save</div>")
    body.find("#save-loadout-buton").click((e)=>
      @saveLoadout(body.find("#loadout-name").val())
      dialog.modal("hide")
    )
    dialog.on('shown', ()->$('#loadout-name').focus())
    dialog.modal('show')

  saveLoadout:(name) ->
    model = new Page.Models.Loadout(name: name, player_id: @model.id)
    model.save({},
      success: (e) => @addLoadout(e)
      error: (e) -> new Error("error saving loadout")
    )

  addItem: (item) ->
    parent = @el.find("#{@field_id(item.get("mount_point"))} > .items")
    item.view = new Page.Views.Item(parent:parent, item:item)
    @updateWeight()

  updateWeight:() ->
    weight = @model.weight().toFixed(2)
    @update("weight", weight)
    tableRows = @el.find('.encumbrance tr')
    tableRows.removeClass('current')
    tableRows.find("td.weight").text("")
    level = @encumbranceLevel(weight)
    row = @field("encumbrance-#{level}")
    row.addClass("current")
    row.find("td.weight").text(weight)

  encumbranceLevel: (weight) ->
    basic_lift = @model.get("basic_lift")
    if weight < basic_lift
      "None"
    else if weight < basic_lift*2
      "Light"
    else if weight < basic_lift*3
      "Medium"
    else if weight < basic_lift*6
      "Heavy"
    else
      "Extra-Heavy"

  updateSpace:() ->
    @update("space", @model.space())

  addLoadout:(loadout) ->
    @field("loadouts").append("<li data-id='#{loadout.id }'><a href='player/#{@model.id}/loadout/#{loadout.id}'> #{loadout.get("name")}</a></li>")
)