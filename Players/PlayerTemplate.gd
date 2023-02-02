extends KinematicBody

var motion := Vector3()
var player_id: int = 1
var my_spawn
var can_move: bool
const SPEED = 10
const UP := Vector3(0,1,0)

func _ready():

	can_move = true
	
func _physics_process(delta):
	move()
	animate()
	face_forward()
	
func move():
	if can_move == true:
		var x = Input.get_action_strength("right_%s" % player_id) - Input.get_action_strength("left_%s" % player_id)
		var z = Input.get_action_strength("down_%s" % player_id) - Input.get_action_strength("up_%s" % player_id)
		motion = Vector3(x, 0, z)
		move_and_slide(motion.normalized() * SPEED, UP)

	
func animate():
	if motion.length() > 0:
		$AnimationPlayer.play("Arms Cross Walk")
	else:
		$AnimationPlayer.stop()	


func face_forward():
	if not motion.x == 0 or not motion.z == 0:
		look_at(Vector3(-motion.x, 0, -motion.z) * SPEED, UP)

func freeze():
	can_move = false
	
func reset():
	can_move = true
	translation = my_spawn.translation
	rotation = my_spawn.rotation
