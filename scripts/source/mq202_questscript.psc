ScriptName MQ202_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard PetrovLogicGuard

;-- Properties --------------------------------------
Int Property iStageBleedout Auto Const
ReferenceAlias Property CaptainPetrov Auto Const mandatory
ReferenceAlias Property BountyHunter_Bull Auto Const mandatory
ReferenceAlias Property BountyHunter_ErinSeptember Auto Const mandatory
ReferenceAlias Property BountyHunter_Raptor Auto Const mandatory
ReferenceAlias Property AlarmSoundMarker Auto Const mandatory
Faction Property MQ202PetrovGuardsFriendsFaction Auto Const mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const mandatory
Faction Property MQ202PetrovEnemyFaction Auto Const mandatory
Faction Property MQ202PetrovFaction Auto Const mandatory
Scene Property MQ202_008_Petrov_BleedoutScene Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckPetrov()
  Guard PetrovLogicGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If !Self.GetStageDone(iStageBleedout)
      Actor PetrovREF = CaptainPetrov.GetActorRef()
      Actor PlayerREF = Game.GetPlayer()
      PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
      PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction)
      PlayerREF.AddtoFaction(MQ202PetrovEnemyFaction)
      PetrovREF.StartCombat(PlayerREF as ObjectReference, False)
    EndIf
    If Self.GetStageDone(iStageBleedout)
      Actor playerref = Game.GetPlayer()
      Actor BullREF = BountyHunter_Bull.GetActorRef()
      Actor ErinSeptemberREF = BountyHunter_ErinSeptember.GetActorRef()
      Actor RaptorREF = BountyHunter_Raptor.GetActorRef()
      Actor petrovref = CaptainPetrov.GetActorRef()
      playerref.RemoveFromFaction(MQ202PetrovEnemyFaction)
      playerref.AddtoFaction(MQ202PetrovFaction)
      playerref.StopCombatAlarm()
      BullREF.StopCombatAlarm()
      ErinSeptemberREF.StopCombatAlarm()
      RaptorREF.StopCombatAlarm()
      petrovref.AllowBleedoutDialogue(True)
      petrovref.SetNoBleedoutRecovery(True)
      petrovref.StopCombat()
      MQ202_008_Petrov_BleedoutScene.Start()
      AlarmSoundMarker.GetRef().Disable(False)
      Self.SetObjectiveCompleted(56, True)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
