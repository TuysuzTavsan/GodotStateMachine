extends Node
class_name XPersistantState

#PersistantState is the "main" script that will be assigned to node.
#States will be added as child and run their logic.
#States can also change states by function calls to mChangeState.
#Any generic information which may be needed from all states such as position, velocity, sprite must be declared here.

var m_state : XState = null #Current state

static var m_states : Dictionary =  {
	STATES.FOO : XFooState,
	STATES.BAR : XBarState
}

enum STATES {
	FOO,
	BAR
}

# Called when the node enters the scene tree for the first time.
func _ready():
	_mChangeState(STATES.FOO)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#If persistantState should do something all the time , code it here.
	#You can also force to change to some specific state here depending on situation.
	
	#Example usage
	if(Input.is_action_just_pressed("ui_right")):
		_mChangeState(STATES.FOO)
	
	if(Input.is_action_just_pressed("ui_left")):
		_mChangeState(STATES.BAR)
	
	pass


#ChangeState, queue free old one, add child new one.
func _mChangeState(state : STATES, params = null) -> void:
	if (m_state != null):
		m_state.queue_free()
		m_state = null
	
	m_state = m_states.get(state).new(params)
	assert(m_state, "Trying to change to nonexisting state.")
	m_state._mSetup(_mChangeState, self)
	add_child(m_state)
