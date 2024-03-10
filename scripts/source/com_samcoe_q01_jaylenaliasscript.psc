ScriptName COM_SamCoe_Q01_JaylenAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Cell Property CityNeonFreestarRanger Auto Const mandatory
{ Cell where Jaylen should be during Sam's quest }
Int Property DisallowTeleport = 215 Auto Const
{ If this stage has been set, stop trying to teleport Price }
Int Property AllowTeleport = 400 Auto Const
{ If this stage has been set, resume teleporting of Price }
ObjectReference Property TeleportTarget Auto Const mandatory
{ Where to teleport Price if criteria is met }
Quest Property FC04 Auto Const mandatory
{ Used to turn off Jaylen's teleport if FC04 is running and still needs him }
Int Property FC04BlockingCompletionStage = 900 Auto Const
{ If this stage is done on FC04, the quest no longer needs him and it's fine to teleport him }

;-- Functions ---------------------------------------

Event OnUnload()
  ObjectReference JaylenREF = Self.GetRef()
  Quest OwningQuest = Self.GetOwningQuest()
  If (!FC04.IsRunning() || FC04.GetStageDone(FC04BlockingCompletionStage)) && !OwningQuest.GetStageDone(DisallowTeleport) && OwningQuest.GetStageDone(AllowTeleport) && JaylenREF.GetParentCell() != CityNeonFreestarRanger
    JaylenREF.Moveto(TeleportTarget, 0.0, 0.0, 0.0, True, False)
  EndIf
EndEvent
