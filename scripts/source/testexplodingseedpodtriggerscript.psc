ScriptName TestExplodingSeedPodTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool bPlayerInTrigger = False

;-- Properties --------------------------------------
ActorValue Property SpeedMult Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  bPlayerInTrigger = True
  Self.AffectPlayer()
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  bPlayerInTrigger = False
  Self.AffectPlayer()
EndEvent

Function AffectPlayer()
  inputenablelayer myLayer = inputenablelayer.Create()
  If bPlayerInTrigger
    Game.GetPlayer().SetValue(SpeedMult, 30.0)
  ElseIf bPlayerInTrigger == False
    Game.GetPlayer().SetValue(SpeedMult, 100.0)
  EndIf
EndFunction
