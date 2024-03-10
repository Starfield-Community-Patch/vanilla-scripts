ScriptName TestNPCPlayerSettings Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property PlayerIsEnemy = False Auto Const
{ True = NPCs will be Hostile to Player }
Bool Property isToggle = False Auto Const
{ True = Each activation will toggle NPC relation to player }

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function
EndEvent

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None)
  Bool treatPlayerAsEnemy = PlayerIsEnemy
  If SpawnControllerFromLink
    If isToggle
      treatPlayerAsEnemy = !(SpawnControllerFromLink as testnpcarenascript).VersusPlayer
    EndIf
    (SpawnControllerFromLink as testnpcarenascript).VersusPlayer = treatPlayerAsEnemy
  EndIf
EndEvent
