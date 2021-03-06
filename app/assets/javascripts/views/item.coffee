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
    @field("add-button").click((e) =>
      new Page.Views.AddItemDialog(
        target:@model,
        itemsUrl:"/base_items_for_item/#{@model.id}")
    )
    @field("remove-button").click((e) =>
      @model.destroy(
        success:() =>
          @el.fadeOut()
          @updateWeight()
          @updateSpace()
        error:(e) => new Error("error removing object")
      )
    )
    @field("trash-button").click((e) =>
      @model.trash(
        success:() =>
          @el.fadeOut()
          @updateWeight()
          @updateSpace()
        error:(e) => new Error("error trashing object")
      )
    )

  addItem: (child) ->
    child.view = new Page.Views.Item(parent:@field("items"), item:child)
    @updateWeight()
    @updateSpace()


  updateWeight:() ->
    @update("weight", @model.weight())
    @model.parent().view.updateWeight()

  updateSpace:() ->
    space = @model.space()
    @update("space", space)
    if(@model.space() > @model.capacity())
      @field("space").addClass("over")
    else
      @field("space").removeClass("over")

    @model.parent().view.updateSpace()
}