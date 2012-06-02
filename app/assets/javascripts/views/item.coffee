Page.Views.Item = Backbone.View.extend {
  initialize:() ->
    @parent = @options.parent
    @item = @options.item
    @render()

  render:() ->
    baseItem = Page.baseItems.get(@item.get("base_item_id"))
    @el = @parent.append(JST["templates/item"].call(item:@item, baseItem: baseItem))
    @el.hide()
    @el.fadeIn()
    for child in Page.items.where(parent_item_id : @item.id)
      parent = @el.find("#item#{@item.id} > .items")
      child.view = new Page.Views.Item(parent:parent, item:child)
}