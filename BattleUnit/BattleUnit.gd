extends CharacterBody2D
#所有可以动的单位都继承这个类，共同的属性和方法之后添加
class_name BattleUnit
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hurtbox: Area2D = $Hurtbox
@onready var hitbox: Area2D = $Marker2D/Hitbox

@export var stats : ClassStats 


func _ready() -> void:
	if not hurtbox.area_entered.is_connected(hit) :
		hurtbox.area_entered.connect(hit)
	if not hitbox.area_entered.is_connected(attack):
		hitbox.area_entered.connect(attack)
	stats.no_health.connect(death)
		
#攻击函数，所有的BattleUnit都具有攻击能力，只有当hitBox进入hurtBox的时候才会调用此函数
func attack(target : Area2D) -> void:
	pass

#受到攻击时触发
func hit(attacker : Area2D) -> void:
	if attacker.get_parent() is BattleUnit: 
		stats.health -= attacker.stats.attack

func death() -> void:
	queue_free()
	
