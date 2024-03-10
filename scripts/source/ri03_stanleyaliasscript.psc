ScriptName RI03_StanleyAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Stanley Auto Const mandatory
ReferenceAlias Property StanleyTerminal Auto Const mandatory
Int Property iStageStanleyLuredAway = 1070 Auto Const
GlobalVariable Property RI03_StanleyInWorkFurniture Auto Const mandatory

;-- Functions ---------------------------------------

Event OnExitFurniture(ObjectReference akActionRef)
  If akActionRef == Stanley.GetRef()
    If Self.GetOwningQuest().GetStageDone(iStageStanleyLuredAway)
      ObjectReference TerminalRef = StanleyTerminal.GetRef()
      TerminalRef.Lock(False, False, True)
      TerminalRef.SetActorRefOwner(Game.GetPlayer(), False)
    EndIf
    RI03_StanleyInWorkFurniture.SetValue(0.0)
  EndIf
EndEvent

Event OnEnterFurniture(Actor akActionRef)
  RI03_StanleyInWorkFurniture.SetValue(1.0)
EndEvent
