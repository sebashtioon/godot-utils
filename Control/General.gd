#############################################
# Name:      Set center offset function
# Description: A function that sets the pivot offset of a 
#              Control node to it's center, to avoid weird sizing
#              in the corner of a node.
#############################################
func set_center_offset(node : Node):
	var node_size = node.get_size()
	node.set_pivot_offset(Vector2(node_size/2))