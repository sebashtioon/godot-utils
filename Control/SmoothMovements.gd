#############################################
# Name: Smooth screen ON/OFF
# Description: This function will animate a node on or off 
#              the screen using a smooth transition.
# Parameters:
# 	    node - The node that you want to animate. Most likely a Control node.
#           transTYPE - The type of transition you want to use. Choose from: "TOP", "BOTTOM", "LEFT", "RIGHT" or "ZOOM".
#           transTIME - The time it takes for the transition to complete.
#           ONorOFF - Choose from: "ON" or "OFF". This will determine if the node will move on or off the screen.
#           HasCenteredOffset - If you want to set the pivot offset to the center of the node. Default is false.
#           
#           Example:
#           SmoothScreenONOFF($ControlNode, "TOP", 0.5, "ON", false)

func SmoothScreenONOFF(node : Node, transTYPE : String, transTIME : float, ONorOFF : String, HasCenteredOffset : bool):

	if HasCenteredOffset == true:
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
		
	else:
		print("Only accepting 'ON' or 'OFF' for ONorOFF parameter.")
		print("Please pass a valid parameter.")
#############################################

#############################################
# Name:        Smooth Camera to XY
# Description: This function will animate the camera to a specific position.
# Parameters: 
#           x - The x position you want the camera to move to.
#           y - The y position you want the camera to move to.
#           TIME - The time it takes for the camera to move to the position.
#           CameraNode - The camera node you want to move.

func SmoothCameraTOXY(x, y, TIME, CameraNode : Node):
	var tween = get_tree().create_tween()
	tween.tween_property(CameraNode, "position", Vector2(x, y), TIME).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
#############################################

#############################################
# Name:        Smooth Mouse UP
# Description: This function will animate a node to scale up. Use this when the mouse is released.
# Parameters:
#           node - The node you want to animate.
func SmoothMouseUP(node : Node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
#############################################

#############################################
# Name:        Smooth Mouse DOWN
# Description: This function will animate a node to scale down. Use this when the mouse is pressed.
# Parameters:
#           node - The node you want to animate.

func SmoothMouseDOWN(node : Node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(0.95, 0.95), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
#############################################

#############################################
# Name:        Smooth Mouse EXIT
# Description: This function will animate a node to scale down and move down. Use this when the mouse exits the node.
# Parameters:
#           tab - A boolean value to determine if the node is a tab or not. If it is a tab, the node will move down.
#           node - The node you want to animate.

func SmoothMouseEXIT(tab : bool, node):
	if tab == true:
		var tween = get_tree().create_tween().set_parallel()
		tween.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
		tween.tween_property(node, "position:y", 462, 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	else:
		var tween2 = get_tree().create_tween().set_parallel()
		tween2.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
#############################################

#############################################
# Name:        Smooth Mouse ENTER
# Description: This function will animate a node to scale up and move up. Use this when the mouse enters the node.
# Parameters:
#           tab - A boolean value to determine if the node is a tab or not. If it is a tab, the node will move up.
#           node - The node you want to animate.

func SmoothMouseENTER(tab : bool, node):
	if tab == true:
		var tween = get_tree().create_tween()
		tween.tween_property(node, "position:y", 472, 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	else:
		var tween = get_tree().create_tween()
		tween.tween_property(node, "scale", Vector2(1.1, 1.1), 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
