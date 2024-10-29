#############################################
# Name:        Smooth screen ON/OFF
# Description: A function that sets the pivot offset of a 
#              Control node to it's center, to avoid weird sizing
#              in the corner of a node.

# How to use:
#           Parameters:
                # node:
#############################################


func SmoothScreenONOFF(node : Node, overlay : bool, transTYPE : String, transTIME : float, ONorOFF : String, CenterOffset : bool):
	
	node.set_visible(true) # If the node is invisible the animation won't show, so I set it to be visible.
	
	
	if overlay == true:
		if ONorOFF == "ON":
			$GreyOverlay.set_self_modulate(Color(1, 1, 1, 0))
			var tween2 = get_tree().create_tween()
			tween2.tween_property($GreyOverlay, "visible", true, 0)
			tween2.tween_property($GreyOverlay, "self_modulate", Color(1, 1, 1, 1), transTIME)
		else:
			var tween = get_tree().create_tween()
			tween.tween_property($GreyOverlay, "self_modulate", Color(1, 1, 1, 0), 0.6)
			tween.tween_property($GreyOverlay, "visible", false, 0)
	else:
		pass
	
	if CenterOffset == true:
		pass
	else:
		var node_size = node.get_size()
		node.set_pivot_offset(Vector2(node_size/2))

	if ONorOFF == "ON":
		if transTYPE == "TOP":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(0, -648)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "BOTTOM":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(0, 648)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "LEFT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(-1152, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "RIGHT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(1152, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "ZOOM":
			var tween = get_tree().create_tween().set_parallel()
			tween.tween_property(node, "position", Vector2(0, 0), 0)
			tween.tween_property(node, "scale", Vector2(1, 1), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

#########################################################
#########################################################
	elif ONorOFF == "OFF":
		if transTYPE == "TOP":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, -648), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "BOTTOM":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 648), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "LEFT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(-1152, 0), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "RIGHT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(1152, 0), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "ZOOM":
			var tween = get_tree().create_tween().set_parallel()
			tween.tween_property(node, "position", Vector2(0, 0), 0)
			tween.tween_property(node, "scale", Vector2(0, 0), transTIME).from(Vector2(1, 1)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		
#########################################################
#########################################################
	else:
		print("Only accepting 'ON' or 'OFF' for ONorOFF parameter.")
		print("Please pass a valid parameter.")