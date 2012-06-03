Page.Views.Player = Backbone.View.extend(
  initialize: () ->
    @player = @options.player
    @render()

  render:() ->
    $('#player-tabs').append(JST["templates/player_tab"].call(player : @player))
    @el = $('#player-content').append(JST["templates/player"].call(player : @player))
    @bindEvents()
    $('ul.nav-tabs a:first').tab('show');

  bindEvents: () ->
    @el.find("#player-#{@player.id}-controls .addItem").click( (e) =>
      new Page.Views.AddItemDialog(target:@player, itemsUrl:'/base_items_for_player'))

  addItem: (item) ->
    parent = @el.find("#player#{@player.id}.items")
    item.view = new Page.Views.Item(parent:parent, item:item)
    @updateWeight()

  updateWeight:() ->
    @el.find("#player-#{@player.id}-weight").text(@player.weight())

)