extends Resource
#该类为所有角色的属性资源
class_name ClassStats

#对象的名字
@export var name : String
#对象的最大生命值
@export var max_health : int : set = set_max_health
#攻击力
@export var attack : int
#防御力
@export var defense :int
#攻击逻辑ai(之后可能会删除)
@export var ai : Script = null

#战斗动画
@export var battle_animations : PackedScene
#战斗技能
@export var battle_actions : Array[Resource]
var level := 1
var health := 1 : set = set_health

signal health_changed
signal no_health
signal max_health_changed
signal level_changed

func set_health(value : int) ->void:
	health = clamp(value, 0, max_health)
	emit_signal("health_changed")
	if health == 0 : emit_signal("no_health")

func set_max_health(value : int) -> void:
	max_health = value
	health = max_health
	emit_signal("max_health_changed")
