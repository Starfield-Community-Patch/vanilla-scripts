ScriptName BECityCYRedTape02QuestScript Extends Quest

;-- Variables ---------------------------------------
Int CountdownTimerID = 1
Int UndockTimerID = 2

;-- Properties --------------------------------------
Int Property TimesUpStage = 32 Auto Const
Int Property GaveFuelStage = 41 Auto Const
Int Property SabotagedFuelStage = 42 Auto Const
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property EnemyShip Auto Const mandatory
Topic Property BE_City_CY_RedTape02_Ship_JumpTopic Auto Const mandatory
Float Property CountdownTimerLength = 20.0 Auto Const
Float Property UndockTimerLength = 5.0 Auto Const

;-- Functions ---------------------------------------

Function StartCountdown()
  Self.StartTimer(CountdownTimerLength, CountdownTimerID)
EndFunction

Function StopCountdown()
  Self.CancelTimer(CountdownTimerID)
EndFunction

Function ShipUndock()
  If Self.GetStageDone(GaveFuelStage) || Self.GetStageDone(SabotagedFuelStage)
    Self.StartTimer(UndockTimerLength, UndockTimerID)
  EndIf
EndFunction

Function ShipGoodbye()
  spaceshipreference myEnemyShip = EnemyShip.GetShipRef()
  myEnemyShip.Say(BE_City_CY_RedTape02_Ship_JumpTopic, None, False, None)
  If Self.GetStageDone(GaveFuelStage)
    myEnemyShip.EnablePartRepair(ShipSystemEngineHealth, True)
    myEnemyShip.RestoreValue(ShipSystemEngineHealth, 100000.0)
    myEnemyShip.DisableWithGravJump()
  ElseIf Self.GetStageDone(SabotagedFuelStage)
    myEnemyShip.Kill(None)
  EndIf
EndFunction

Function RemoveShipParts()
  Actor myPlayer = Game.GetPlayer()
  spaceshipreference myShip = PlayerShip.GetShipReference()
  If myPlayer.GetItemCount(ShipRepairKit as Form) >= 1
    myPlayer.RemoveItem(ShipRepairKit as Form, 1, False, None)
  ElseIf myShip.GetItemCount(ShipRepairKit as Form) >= 1
    myShip.RemoveItem(ShipRepairKit as Form, 1, False, None)
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == CountdownTimerID
    Self.SetStage(TimesUpStage)
  ElseIf aiTimerID == UndockTimerID
    Self.ShipGoodbye()
  EndIf
EndEvent
