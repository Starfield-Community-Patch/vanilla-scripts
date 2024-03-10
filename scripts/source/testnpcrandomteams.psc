ScriptName TestNPCRandomTeams Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const
{ Either fill this with the spawn controller, or use a default linkedRef to the spawn controller }
Bool Property instantSpawn = False Auto Const
{ If true, will randomize and spawn NPCs with a single activation }
Bool Property onlyRedTeam = False Auto Const
Int Property teamSizeMinimum = -1 Auto Const
Int Property teamSizeMaximum = -1 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None)
  If SpawnControllerFromLink
    If teamSizeMaximum > -1 && teamSizeMinimum > -1
      (SpawnControllerFromLink as testnpcarenascript).SetRandomTeams(instantSpawn, onlyRedTeam, Self as ObjectReference, teamSizeMinimum, teamSizeMaximum)
    Else
      (SpawnControllerFromLink as testnpcarenascript).SetRandomTeams(instantSpawn, onlyRedTeam, Self as ObjectReference, 3, 6)
    EndIf
  ElseIf SpawnController
    (SpawnController as testnpcarenascript).SetRandomTeams(instantSpawn, onlyRedTeam, Self as ObjectReference, 3, 6)
  EndIf
EndEvent
