ScriptName UC01_OrientationDisplayQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TualaReads Auto mandatory
{ Alias used to manage Commander Tuala looking at his slate while the UCR quests spool up }
ReferenceAlias Property Tuala Auto Const mandatory
{ Ref alias for Commander Tuala }

;-- Functions ---------------------------------------

Function StartTualaAnimState()
  Actor TAct = Tuala.GetActorRef()
  TualaReads.ForceRefTo(TAct as ObjectReference)
  TAct.EvaluatePackage(False)
EndFunction

Function SendHaltScenes(ObjectReference akSceneTarget)
  Var[] kargs = new Var[1]
  kargs[0] = akSceneTarget as Var
  Self.SendCustomEvent("uc01_orientationdisplayquestscript_HaltOrientationScenes", kargs)
EndFunction
