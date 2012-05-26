Page.Views.Edit = Backbone.View.extend(
  events:
    "submit form" : "save"

  initialize: () ->
    _.bindAll(this, 'render')
    @model.bind('change', @render)
    @render()

  save: () ->
    self = this
    msg = if @model.isNew() then 'Successfully created!' else 'Saved!'

    @model.save(
      { name: this.$('[name=name]').val() },
      {
        success: (model, resp) ->
          new Page.Views.Notice(message:msg)
          self.model = model
          self.render()
          self.delegateEvents()

          Backbone.history.navigate('inventory/'+model.id)
        error: () ->
          new Page.Views.Error()
      }
    )
    false

  render: () ->
    html = JST["templates/inventory"].call(model: this.model)
    $(this.el).html(html)
    $('#app').html(this.el)
)
