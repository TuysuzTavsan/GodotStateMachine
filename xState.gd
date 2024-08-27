extends CharacterBody3D #for example
class_name XState

#Generic XState class
#Additional information which doesnt belong to XPersistantState but the generic XState itself should exist here.

var m_owner : XPersistantState #Owner of this state which holds all information.
var m_virtualChangeStateFunc : Callable #Callable reference to the owners ChangeState function. So every state can change state in their _process.


#Any custom state which extends XState and implements _proceess will be called instead of the code below.
#If you want code below to run on every state regardless, use super(_delta)
func _process(_delta):
	print("HELLO I AM XSTATE, any state that implements _process will be called instead/after me!")

#Generic Setup function to assign must have fields of this.
func mSetup(changeState : Callable, owner_ : XPersistantState) -> void:
	m_virtualChangeStateFunc = changeState
	m_owner = owner_
