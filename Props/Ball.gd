extends RigidBody

onready var my_spawn

func _ready():
	my_spawn = get_tree().get_root().find_node("BallStart", true, false)
	
func reset():
	translation = my_spawn.translation
	rotation = my_spawn.rotation
	angular_velocity = Vector3(0,0,0)
	linear_velocity = Vector3(0,0,0)
	axis_lock_linear_x = false
	axis_lock_linear_y = false
	axis_lock_linear_z = false

	
func freeze(id):
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true
	

func _on_Ball_body_exited(body):
	if body is KinematicBody:
		$AudioStreamPlayer.play()
