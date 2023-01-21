extends Area2D

signal hit_collectables
signal hit_enemy

var screen_size
var screen_left_clamp
var screen_right_clamp

export var speed= 400
export var gravity_force = 980

func _ready():
	screen_size= get_viewport_rect().size
	screen_left_clamp=screen_size.x/8
	screen_right_clamp=screen_size.x-screen_size.x/8
	
	
func _process(delta):
	
	var velocity= Vector2.ZERO
	if Input.is_action_pressed("move-right"):
		velocity.x+=1
	if Input.is_action_pressed("move_left"):
		velocity.x-=1
	
	if velocity.length()>0:
		velocity.x= velocity.normalized().x*speed
	
	velocity.y+=gravity_force
	
	position+=velocity*delta
	position.x=clamp(position.x, screen_left_clamp, screen_right_clamp)
	position.y=clamp(position.y, 0, screen_size.y)
	
func on_collectible_hit():
	pass
