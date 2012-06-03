Page.Views.Base = Backbone.View.extend {

  elId:() -> [@model.name, @model.id].join("-")
  el_id:() -> "##{@elId()}"

  fieldId:(fieldName) -> [@model.name, @model.id, fieldName].join("-")

  field_id:(fieldName) -> "##{@fieldId(fieldName)}"

  field:(fieldName) -> @el.find(@field_id(fieldName))

  bindEl:() -> @el = $("##{@elId()}")


  update:(field, value) -> @field(field).text(value)
}