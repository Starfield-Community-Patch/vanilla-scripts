ScriptName City_GG_Mark_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Bonifac Auto Const mandatory
ReferenceAlias Property Maldonado Auto Const mandatory

;-- Functions ---------------------------------------

Function StopCombatOnNPCs()
  Game.GetPlayer().StopCombat()
  Actor BonACT = Bonifac.GetActorRef()
  BonACT.StopCombatAlarm()
  BonACT.StopCombat()
  Actor MalACT = Maldonado.GetActorRef()
  MalACT.StopCombatAlarm()
  MalACT.StopCombat()
EndFunction
