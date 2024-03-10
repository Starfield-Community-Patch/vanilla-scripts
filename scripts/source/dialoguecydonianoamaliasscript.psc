ScriptName DialogueCydoniaNoamAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor myActor = Self.GetActorRef()
  myActor.SetEssential(True)
  myActor.SetNoBleedoutRecovery(True)
  myActor.AllowBleedoutDialogue(True)
  Float fHealth = myActor.GetValue(Health)
  myActor.DamageValue(Health, fHealth + 100.0)
EndEvent
