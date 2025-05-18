extends Area2D

export var speed := 80
var player

func is_class(t):
    return t == "Boss" or .is_class(t)

func _ready():
    player = get_parent().get_node("Player")

func _process(delta):
    if player:
        var dir = (player.position - position).normalized()
        position += dir * speed * delta

func _on_Boss_area_entered(area):
    if area.is_class("Player"):
        get_parent().end('LOSE')

func _on_ShootTimer_timeout():
    var bullet = get_parent().ParticleScene.instance()
    bullet.position = position
    bullet.velocity = (player.position - position).normalized() * bullet.max_speed
    bullet.energy = 3
    get_parent().add_child(bullet)
