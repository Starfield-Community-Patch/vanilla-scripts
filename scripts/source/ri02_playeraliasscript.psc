ScriptName RI02_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const mandatory
GlobalVariable Property RI02_AstralLoungeBodyCount Auto Const mandatory
Int Property iStartTrackingStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnKill(ObjectReference akVictim)
  Quest MyQuest = Self.GetOwningQuest()
  If MyQuest.GetStageDone(iStartTrackingStage)
    If akVictim.GetCurrentLocation() == CityNeonTradeTowerAstralLoungeLocation
      RI02_AstralLoungeBodyCount.SetValue(RI02_AstralLoungeBodyCount.GetValue() + 1.0)
    EndIf
  EndIf
EndEvent
