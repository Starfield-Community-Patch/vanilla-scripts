ScriptName MQ302B_HelixScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Helix_AndrejaVoice Auto Const mandatory
ReferenceAlias Property Helix_BarrettVoice Auto Const mandatory
ReferenceAlias Property Helix_SamVoice Auto Const mandatory
ReferenceAlias Property Helix_SarahVoice Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
GlobalVariable Property MQ_CompanionDead Auto Const mandatory

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnLoad()
    Self.gotostate("HasBeenTriggered")
    Int iCompanionDead = MQ_CompanionDead.GetValueInt()
    spaceshipreference HelixREF = Self.GetShipRef()
    If iCompanionDead == COM_CompanionID_Andreja.GetValueInt()
      Helix_AndrejaVoice.ForceRefTo(HelixREF as ObjectReference)
    ElseIf iCompanionDead == COM_CompanionID_Barrett.GetValueInt()
      Helix_BarrettVoice.ForceRefTo(HelixREF as ObjectReference)
    ElseIf iCompanionDead == COM_CompanionID_SamCoe.GetValueInt()
      Helix_SamVoice.ForceRefTo(HelixREF as ObjectReference)
    ElseIf iCompanionDead == COM_CompanionID_SarahMorgan.GetValueInt()
      Helix_SarahVoice.ForceRefTo(HelixREF as ObjectReference)
    EndIf
  EndEvent
EndState
