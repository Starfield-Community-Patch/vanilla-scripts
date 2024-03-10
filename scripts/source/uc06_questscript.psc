ScriptName UC06_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property SQ_PlayerShip Auto Const mandatory
{ Quest for the player's ship }
MiscObject Property UC06_OrlaseID Auto Const mandatory
{ Orlase's ID }
Int Property StageToSet = 550 Auto Const
{ Stage to set once the player has collected Orlase's ID }
ActorValue Property SpaceshipCrew Auto Const mandatory
{ Actor value used to adjust Spaceship Crew }
ActorValue Property Assistance Auto Const mandatory
{ Actor value used to adjust NPC assistance }
ActorValue Property HideShipFromHUDValue Auto Const mandatory
{ Actor value used to turn off ships in the player's HUD (used for ambush purposes) }
Faction Property PlayerFriendFaction Auto Const mandatory
{ Faction used to keep the turrets from going hostile to the player until the last possible moment }
RefCollectionAlias Property EthereaTurrets Auto Const mandatory
{ Collection of Orlase's turrets for his ambush }

;-- Functions ---------------------------------------

Function RegisterForShipItemCollection()
  ReferenceAlias PlayerShipAlias = (SQ_PlayerShip as sq_playershipscript).PlayerShip
  If PlayerShipAlias != None
    Self.RegisterForRemoteEvent(PlayerShipAlias as ScriptObject, "OnItemAdded")
    Self.AddInventoryEventFilter(UC06_OrlaseID as Form)
  EndIf
EndFunction

Event ReferenceAlias.OnItemAdded(ReferenceAlias akSender, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If (akBaseItem == UC06_OrlaseID as Form) && !Self.GetStageDone(StageToSet) && akSender == (SQ_PlayerShip as sq_playershipscript).PlayerShip
    Self.RemoveAllInventoryEventFilters()
    Self.SetStage(StageToSet)
  EndIf
EndEvent

Function PrepTurrets()
  Int I = 0
  Int iCount = EthereaTurrets.GetCount()
  While I < iCount
    spaceshipreference currRef = EthereaTurrets.GetAt(I) as spaceshipreference
    currRef.SetUnconscious(True)
    currRef.SetValue(HideShipFromHUDValue, 1.0)
    I += 1
  EndWhile
EndFunction

Function DeployTurrets()
  Int I = 0
  Int iCount = EthereaTurrets.GetCount()
  While I < iCount
    spaceshipreference currRef = EthereaTurrets.GetAt(I) as spaceshipreference
    (currRef as uc06_turretonlinescript).SetTurretOnline()
    I += 1
  EndWhile
EndFunction

Function DisableTurrets()
  Int I = 0
  Int iCount = EthereaTurrets.GetCount()
  While I < iCount
    spaceshipreference currRef = EthereaTurrets.GetAt(I) as spaceshipreference
    currRef.SetUnconscious(True)
    currRef.AddToFaction(PlayerFriendFaction)
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
