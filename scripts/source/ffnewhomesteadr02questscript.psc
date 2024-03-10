ScriptName FFNewHomesteadR02QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CostumeStage = 300 Auto Const
Int Property ReturnStage = 400 Auto Const
ReferenceAlias Property Tourist01 Auto Const mandatory
Armor Property Clothes_Monster_Costume Auto Const mandatory
Float Property CooldownTimerDays = 3.0 Auto Const
GlobalVariable Property FFNewHomesteadR02_CooldownTime Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckDistanceForTourists()
  Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Tourist01.GetRef() as ScriptObject, 20.0, 0)
EndFunction

Function SetCooldown()
  FFNewHomesteadR02_CooldownTime.SetValue(Utility.GetCurrentGameTime() + CooldownTimerDays)
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If Game.GetPlayer().IsEquipped(Clothes_Monster_Costume as Form) && Self.GetStageDone(CostumeStage) && !Self.GetStageDone(ReturnStage)
    Self.SetStage(ReturnStage)
    Self.UnregisterForDistanceEvents(Game.GetPlayer() as ScriptObject, Tourist01.GetRef() as ScriptObject, -1)
  Else
    Self.CheckDistanceForTourists()
  EndIf
EndEvent
