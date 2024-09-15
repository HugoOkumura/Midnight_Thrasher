extends Camera2D

func init_camera_limits(map_bounds: Rect2) ->void:
	set_limit(Side.SIDE_LEFT, int(map_bounds.position.x))
	set_limit(Side.SIDE_RIGHT, int(map_bounds.size.x + map_bounds.position.x))
	set_limit(Side.SIDE_TOP, int(map_bounds.position.y))
	set_limit(Side.SIDE_BOTTOM, int(map_bounds.size.y + map_bounds.position.y))
