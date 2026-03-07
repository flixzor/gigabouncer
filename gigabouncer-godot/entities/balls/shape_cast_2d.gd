extends ShapeCast2D

@onready var collision_shape_2d: CollisionShape2D = $"../CollisionShape2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shape = collision_shape_2d.shape
