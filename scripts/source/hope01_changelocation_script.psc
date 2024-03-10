ScriptName Hope01_ChangeLocation_Script Extends Quest Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group FailQuest
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Int Property Hope01_StageRequired = 100 Auto Const
  Int Property Hope01_StageToSet = 8900 Auto Const
EndGroup

Location Property AkilaCityLocation Auto Const mandatory
Keyword Property Contraband Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Actor aPlayer = Game.GetPlayer()
  If akSender == aPlayer && akNewLoc == AkilaCityLocation && Self.GetStageDone(100)
    If Game.GetPlayer().GetItemCount(Contraband as Form) > 0 || PlayerShip.GetReference().GetItemCount(Contraband as Form) > 0
      Self.SetStage(300)
    EndIf
  EndIf
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == Hope01_StageRequired
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_ContrabandConfiscated")
  ElseIf auiStageID == Hope01_StageToSet
    Self.UnregisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_ContrabandConfiscated")
  EndIf
EndEvent

Event SQ_ParentScript.SQ_ContrabandConfiscated(sq_parentscript akSource, Var[] akArgs)
  If Self.GetStageDone(Hope01_StageRequired) && Self.GetStageDone(Hope01_StageToSet) == False
    Self.SetStage(Hope01_StageToSet)
  EndIf
EndEvent
