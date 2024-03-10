ScriptName CF05_TerminalActivationScript Extends ReferenceAlias
{ Script to prevent player from taking item that Guard is standing right in front of }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BlockingScene Auto Const mandatory
Int Property AlarmStage Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Float Property DistanceCheck = 8.0 Auto Const
Faction Property LC043SY01Faction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetRef().BlockActivation(True, False)
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Quest myQuest = Self.GetOwningQuest()
  Actor PlayerRef = Game.GetPlayer()
  If akActionRef == PlayerRef as ObjectReference
    If !PlayerRef.IsInFaction(LC043SY01Faction) && !myQuest.GetStageDone(AlarmStage) && Self.GetRef().GetDistance(Alias_Guard.GetRef()) < DistanceCheck
      BlockingScene.Start()
    Else
      Self.GetRef().Activate(PlayerRef as ObjectReference, True)
    EndIf
  EndIf
EndEvent
