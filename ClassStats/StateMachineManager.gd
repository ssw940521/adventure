extends Node
class_name StateMachineManager
#状态机下面的子节点，状态在节点之间转换
@onready var stateNodes : Array = []
@onready var current : BaseState
#存储一些公共数据
@onready var data := {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	init_data()
	stateNodes = get_children() 
	current = stateNodes[0]
	current.enter()

func changeState(target : int) -> void:
	current.exit()
	current = stateNodes[target]
	current.enter()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	current.process_state()

func init_data()->void:
	data[BaseState.DIRECTION] = "right"
