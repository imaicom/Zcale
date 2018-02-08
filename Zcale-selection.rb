module Zcale_selection
def Zcale_selection.main

mod  = Sketchup.active_model
ent  = mod.active_entities
sel  = mod.selection

if sel.length > 0
  mod.start_operation "Zcale_selection 1 inch to 1 mm"
  scale = 1.0 / 25.4
  t = Geom::Transformation.scaling scale
  sel.each do |e|
    if e.is_a? Sketchup::Group
      e.entities.transform_entities t, e.entities.to_a
    end
  end
  mod.commit_operation; # "Zcale_selection 1 inch to 1 mm"
  Sketchup.send_action('viewZoomToSelection:')
  prompts = ["End of Zcale 1 inch to 1 mm"]  
  UI.messagebox prompts
end

end; # def Zcale_selection.main
end; # module Zcale_selection

if not file_loaded?(__FILE__)
#	UI.menu("Draw").add_separator 
	UI.menu("Draw").add_item("Zcale 1 inch to 1 mm") { Zcale_selection.main }
	
	UI.add_context_menu_handler do |context_menu|
	  context_menu.add_item("Zcale 1 inch to 1 mm") { Zcale_selection.main }
	end

	file_loaded(__FILE__)
end
