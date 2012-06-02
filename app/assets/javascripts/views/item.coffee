Page.Views.Item = Backbone.View.extend {
  initialize:() ->
    @parent = @options.parent
    @item = @options.item
    @render()

  render:() ->
    baseItem = Page.baseItems.get(@item.get("base_item_id"))
    @parent.append(JST["templates/item"].call(item:@item, baseItem: baseItem))
    @el = $("#item-#{@item.id}-container")
    @el.hide()
    @el.fadeIn()
    @bindEvents()
    for child in Page.items.where(parent_item_id : @item.id)
      parent = @el.find("#item-#{@item.id}-items")
      child.view = new Page.Views.Item(parent:parent, item:child)

  bindEvents: () ->
    controls = @el.find("#item-#{@item.id}-controls").first()
    controls.find(".addItem").click((e) => new Page.Views.AddItemDialog(target:@item, itemsUrl:"/base_items_for_item/#{@item.id}"))
    controls.find(".remove").click((e) =>
      @item.destroy(
        success:() => @el.fadeOut()
        error:(e) => new Error("error removing object")
      )
    )

  addItem: (child) ->
    parent = $("#item-#{@item.id}-items")
    child.view = new Page.Views.Item(parent:parent, item:child)
}