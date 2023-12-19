extends Area2D


@onready var sprite_2d = $Sprite2D
@export var speed = 200;
var move_ticks = 0;


func _process(delta):
	# Move!
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1

	position += velocity.normalized() * speed * delta

	# Look in the correct dirtion
	sprite_2d.flip_h = velocity.x > 0

	# Wobble!
	if velocity.length() > 0:
		move_ticks += 1;
		rotation = sin(move_ticks / 4.0) / 3.0
	else:
		move_ticks = 0
		rotation = 0


func _on_body_entered(body):
	hide()
