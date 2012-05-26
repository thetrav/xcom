Page.Views.Notice = Backbone.View.extend(
  initialize: () ->
    @render()

  render: () ->
    html = JST["templates/notice"].call(model: this.model)
    $(this.el).html(html)
    $('#app').html(this.el)
)