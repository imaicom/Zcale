# Select entities first...
UI.menu("Plugins").add_item("Explode"){
  model=Sketchup.active_model
  entities=model.active_entities
  selection=model.selection
  model.start_operation("Explode")
  selection.to_a.each{|e|e.explode}
  model.commit_operation
}
###
