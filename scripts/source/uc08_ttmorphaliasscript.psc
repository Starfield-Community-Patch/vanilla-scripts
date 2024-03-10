ScriptName UC08_TTMorphAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 450 Auto Const
{ Only start the teleportin' once this stage is set on UC08 }
ObjectReference Property TeleportMarker Auto Const mandatory
{ Marker to teleport this critter to }
ReferenceAlias Property NonHostileTT Auto Const mandatory
{ Alias used to keep the Transformed Morph friendly to the player }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.GetOwningQuest().GetStageDone(PrereqStage)
    Self.ProcessTTMorph()
  EndIf
EndEvent

Event OnUnload()
  If Self.GetOwningQuest().GetStageDone(PrereqStage)
    Self.ProcessTTMorph()
  EndIf
EndEvent

Function ProcessTTMorph()
  Actor currACT = Self.GetActorRef()
  NonHostileTT.Clear()
  If currACT.IsGhost()
    currACT.SetGhost(False)
  EndIf
  If !currACT.IsDead()
    currACT.MoveTo(TeleportMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction
