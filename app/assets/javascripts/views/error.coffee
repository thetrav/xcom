Error = Backbone.View.extend(
  initialize: () =>
    @render()

  render:() ->
    $('#error').html("<p>#{@options.error}</p>")
)