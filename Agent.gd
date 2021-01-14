extends RigidBody3D

@export var velocity: float = 10
@onready var target_node = $"../../Position3D"

func _ready():
	var target = target_node.get_global_transform().origin
	print(target)
	$NavigationAgent3D.set_target_location(target)

func _physics_process(delta):
	var target = $NavigationAgent3D.get_next_location()
	var pos = get_global_transform().origin
	
	var n = $RayCast3D.get_collision_normal()
	if n.length_squared() < 0.001:
		n = Vector3(0, 1, 0)
	var vel = (target - pos).normalized() * velocity
#	print(vel)
	set_linear_velocity(vel)
