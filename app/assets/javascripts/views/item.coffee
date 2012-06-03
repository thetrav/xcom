Page.Views.Item = Page.Views.Base.extend {
  initialize:() ->
    @parent = @options.parent
    @model = @options.item
    @render()

  render:() ->
    @parent.append(JST["templates/item"].call(model:@model, view:this))
    @bindEl()
    @el.hide()
    @el.fadeIn()
    @bindEvents()
    for child in Page.items.where(parent_item_id : @model.id)
      child.view = new Page.Views.Item(parent:@field("items"), item:child)

  bindEvents: () ->
    controls = @field("controls").first()
    controls.find(".addItem").click((e) =>
      new Page.Views.AddItemDialog(
        target:@model,
        itemsUrl:"/base_items_for_item/#{@model.id}")
    )
    controls.find(".remove").click((e) =>
      @model.destroy(
        success:() =>
          @el.fadeOut()
          @updateWeight()
        error:(e) => new Error("error removing object")
      )
    )

  addItem: (child) ->
    child.view = new Page.Views.Item(parent:@field("items"), item:child)
    @updateWeight()

  updateWeight:() ->
    @field("weight").text(@model.weight())
    @model.parent().view.updateWeight()
}