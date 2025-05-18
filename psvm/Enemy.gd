extends Area2D

export var speed := 150
var player
var velocity := Vector2()

func is_class(t):
    return t == "Enemy" or .is_class(t)

func _ready():
    player = get_parent().get_node("Player")

func _process(delta):
    if player:
        velocity = (player.position - position).normalized() * speed
        position += velocity * delta

func _on_Enemy_area_entered(area):
    if area.is_class("Player"):
        get_parent().end('LOSE')
