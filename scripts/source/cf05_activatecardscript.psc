ScriptName CF05_ActivateCardScript Extends ReferenceAlias
{ Script to prevent player from taking item that Guard is standing right in front of }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BlockingScene Auto Const mandatory
Int Property StageToCheck Auto Const mandatory
Int Property AlarmStage Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Float Property DistanceCheck = 4.0 Auto Const

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Busy")
    Quest myQuest = Self.GetOwningQuest()
    If !myQuest.GetStageDone(StageToCheck) && !myQuest.GetStageDone(AlarmStage) && Self.GetRef().GetDistance(Alias_Guard.GetRef()) < DistanceCheck && !Game.GetPlayer().IsinFaction(LC043SY01Faction)
      BlockingScene.Start()
      Self.GotoState("Waiting")
    Else
      Game.GetPlayer().AddItem(Self.GetRef() as Form, 1, False)
    EndIf
  EndEvent

  Event OnAliasInit()
    Self.GetRef().BlockActivation(True, False)
  EndEvent
EndState
