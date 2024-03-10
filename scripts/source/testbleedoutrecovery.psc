ScriptName TestBleedoutRecovery Extends Actor

;-- Variables ---------------------------------------
Bool bDownNPC

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !bDownNPC
    Self.SetNoBleedoutRecovery(False)
    Self.DamageValue(Health, 10000.0)
    bDownNPC = True
  Else
    bDownNPC = False
  EndIf
EndEvent
