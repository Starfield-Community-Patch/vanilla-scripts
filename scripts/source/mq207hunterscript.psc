ScriptName MQ207HunterScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property KeeperAquilus Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered")
    Actor HunterREF = Self.GetActorRef()
    HunterREF.WaitFor3dLoad()
    HunterREF.CopyAppearance(KeeperAquilus.GetActorRef())
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered

  Event OnLoad()
    ; Empty function
  EndEvent

  Event OnUnload()
    Self.gotostate("WaitingForPlayer")
  EndEvent
EndState
