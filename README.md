* My preferred Godot state machine template.

- xPersistantState is the 'main' script that owns states.
- xState is the base class for every state.
- xFooState and xBarState are example states derived from xState.

You can change states from xPersistantState or current state class via callback.
States also have a reference to xPersistantState as m_owner. This allows quick access to main node properties.
