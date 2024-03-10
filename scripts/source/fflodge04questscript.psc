ScriptName FFLodge04QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PlaqueRef_Sam_Bar Auto Const
ObjectReference Property PlaqueRef_Andreja_Bar Auto Const
ObjectReference Property PlaqueRef_Barrett_Bar Auto Const
ObjectReference Property PlaqueRef_Sam_Garden Auto Const
ObjectReference Property PlaqueRef_Andreja_Garden Auto Const
ObjectReference Property PlaqueRef_Barrett_Garden Auto Const
ObjectReference Property PlaqueRef_Sam_Center Auto Const
ObjectReference Property PlaqueRef_Andreja_Center Auto Const
ObjectReference Property PlaqueRef_Barrett_Center Auto Const
ReferenceAlias Property DeadCompanion Auto Const
ReferenceAlias Property Andreja Auto Const
ReferenceAlias Property Barrett Auto Const
ReferenceAlias Property Sam Auto Const

;-- Functions ---------------------------------------

Function EnablePlaque()
  If DeadCompanion.GetActorReference() == Andreja.GetActorReference()
    If Self.GetStageDone(10)
      PlaqueRef_Andreja_Center.Enable(False)
    ElseIf Self.GetStageDone(20)
      PlaqueRef_Andreja_Garden.Enable(False)
    ElseIf Self.GetStageDone(30)
      PlaqueRef_Andreja_Bar.Enable(False)
    Else
      PlaqueRef_Andreja_Center.Enable(False)
    EndIf
  ElseIf DeadCompanion.GetActorReference() == Barrett.GetActorReference()
    If Self.GetStageDone(10)
      PlaqueRef_Barrett_Center.Enable(False)
    ElseIf Self.GetStageDone(20)
      PlaqueRef_Barrett_Garden.Enable(False)
    ElseIf Self.GetStageDone(30)
      PlaqueRef_Barrett_Bar.Enable(False)
    Else
      PlaqueRef_Barrett_Garden.Enable(False)
    EndIf
  ElseIf DeadCompanion.GetActorReference() == Sam.GetActorReference()
    If Self.GetStageDone(10)
      PlaqueRef_Sam_Center.Enable(False)
    ElseIf Self.GetStageDone(20)
      PlaqueRef_Sam_Garden.Enable(False)
    ElseIf Self.GetStageDone(30)
      PlaqueRef_Sam_Bar.Enable(False)
    Else
      PlaqueRef_Sam_Bar.Enable(False)
    EndIf
  EndIf
  Self.SetStage(200)
EndFunction
