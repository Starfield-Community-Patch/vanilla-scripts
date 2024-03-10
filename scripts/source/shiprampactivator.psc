ScriptName ShipRampActivator Extends ObjectReference conditional
{ Handles opening and closing of ship ramp }

;-- Variables ---------------------------------------
Bool inTrigger = False
ObjectReference myTrigger
ObjectReference player

;-- Properties --------------------------------------
Group Required_Properties
  String Property openAnim = "RampOpen" Auto
  { Animation to play when opening }
  String Property closeAnim = "RampClose" Auto
  { Animation to play when closing }
  String Property openEvent = "Done" Auto
  { Open event name - waits for this event before considering itself "open" }
  String Property closeEvent = "Done" Auto
  { Close event name - waits for this event before considering itself "closed" }
  Bool Property playerShip = False Auto
  { default:FALSE - set to true if the ramp belongs to the player ship }
EndGroup

Group Optional_Properties
  Bool Property isOpen = False Auto conditional
  { Set to TRUE to start open. }
  Bool Property doOnce = False Auto
  { Set to TRUE to open/close on first trigger only. }
  Bool Property shouldSetDefaultState = False Auto Const
  { Should this use SetDefaultState? Set to False only for Activators with identical open/close events. }
  String Property startOpenAnim = "Play01" Auto
  { OnLoad calls this if the object starts in the open state }
  Bool Property InvertCollision = False Auto
  { Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be
	Disabled onOpen, and Enabled on Close.  If you want that functionality inverted set this to TRUE }
EndGroup

Group Autofill_Properties
  Keyword Property TwoStateCollisionKeyword Auto
  { Keword to link to the collision you want to enable/disable based on this activators opened/closed state. }
EndGroup

Int Property myState = 1 Auto conditional hidden
{ true when static or animating
 0 == open or opening
 1 == closed or closing }
