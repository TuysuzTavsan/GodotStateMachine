extends XState
class_name  XBarState

#State specific variants and logic should live here.

#Additional parameters can be used to customize init function.
#Because XPersistantState.mChangeState will pass additional parameters to XFooState.new(params)
func _init(_params : Dictionary = {}):
	pass

#You can call generic XState process with super.
func _process(_delta):
	print("BARRRRRRRR I am the XBarState")
	super(_delta)
	
	#You can change state here.
	#if(someCondition):
		#m_virtualChangeFunc.call(XPersistantState.STATES.FOO, additionalParams)
