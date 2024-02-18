extends CharacterBody2D

var mouse_pos = Vector2()
var to_go_to = Vector2()

var fleet_size = 1.0 						#multiplicateur pour réduire la vitesse en fonction de la taille de la flotte
var fleet_speed = 200 * fleet_size



func move_to_mouse():
	#
	#var dead_zone = Vector2(10, 10) #règle le bug de shaking 
	
	if Input.is_action_pressed("left_click"):
		mouse_pos = get_global_mouse_position()
		rotate(get_angle_to(mouse_pos))
	
	to_go_to = (mouse_pos - position).normalized()
	velocity = to_go_to * fleet_speed 
	
	#if  mouse_pos - position > dead_zone or mouse_pos - position < dead_zone :
		#velocity = Vector2.ZERO
	

#############################################################################################################################

func _physics_process(_delta):
	
	move_to_mouse()
	move_and_slide()
