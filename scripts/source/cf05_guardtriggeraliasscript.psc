ScriptName CF05_GuardTriggerAliasScript Extends ReferenceAlias
{ Script to handle the security guards, the checks they run, and the scenes they play as a result. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property GuardSceneToPlay Auto Const mandatory
{ Scene to play when the player enters the trigger volume. }
Bool Property CheckStage Auto Const
{ Determines whether or not to check for a stage vs uniform.
False = Check uniform
True = Check quest stage }
Int Property iStageToCheck = -1 Auto Const
{ Stage to check to determine if scene will play. }
Int Property iStageDone = -1 Auto Const
{ Stage to check to prevent scene playing again. }
Armor Property UniformToCheck Auto Const
{ Uniform to check to determine if scene will play. }
ReferenceAlias Property GuardAliasToCheck Auto Const mandatory
{ The guard alias to check for detection that's in the scene. }
Scene Property CF05_1000_CargoBayGuard01_TeleportPlayer Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer()
  If (akActionRef == PlayerRef as ObjectReference) && !PlayerRef.IsTrespassing()
    If !CheckStage && !Self.GetOwningQuest().GetStageDone(iStageDone)
      If !PlayerRef.IsEquipped(UniformToCheck as Form) && !CF05_1000_CargoBayGuard01_TeleportPlayer.IsPlaying()
        GuardSceneToPlay.Start()
      EndIf
    ElseIf !Self.GetOwningQuest().GetStageDone(iStageToCheck) && !CF05_1000_CargoBayGuard01_TeleportPlayer.IsPlaying()
      GuardSceneToPlay.Start()
    EndIf
  EndIf
EndEvent
