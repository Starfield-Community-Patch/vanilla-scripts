ScriptName MQ404Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property HunterAppearsStage = 130 Auto Const
Int Property HunterAppearsPrereqStage = 120 Auto Const

;-- Functions ---------------------------------------

Function WaitForWorkshopMenuClose()
  Self.RegisterForMenuOpenCloseEvent("WorkshopMenu")
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "WorkshopMenu"
    If abOpening == False && Self.GetStageDone(HunterAppearsPrereqStage)
      Self.SetStage(HunterAppearsStage)
      Self.UnRegisterForMenuOpenCloseEvent("WorkshopMenu")
    EndIf
  EndIf
EndEvent
