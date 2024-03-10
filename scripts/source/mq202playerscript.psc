ScriptName MQ202PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property MQ202PetrovFaction Auto Const mandatory
Faction Property MQ202PetrovGuardsFaction Auto Const mandatory
Faction Property MQ202PetrovTerminalsFaction Auto Const mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const mandatory
Faction Property MQ202PetrovGuardsFriendsFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Int Property PlayerKillPrereqStage = 410 Auto Const
Int Property PlayerKillSetStage = 420 Auto Const
ReferenceAlias Property ArmoryTerminal Auto Const mandatory
ReferenceAlias Property ZooTerminal Auto Const mandatory
ReferenceAlias Property ZooAreaGuard01 Auto Const mandatory
ReferenceAlias Property ZooAreaGuard02 Auto Const mandatory
ReferenceAlias Property ZooAreaGuard03 Auto Const mandatory
ReferenceAlias Property CaptainPetrov Auto Const mandatory

;-- Functions ---------------------------------------

Event OnKill(ObjectReference akVictim)
  Quest MyQuest = Self.GetOwningQuest()
  If (akVictim as Actor).IsInFaction(MQ202PetrovFaction)
    If MyQuest.GetStageDone(PlayerKillPrereqStage)
      MyQuest.SetStage(PlayerKillSetStage)
    EndIf
  EndIf
EndEvent

Event OnPickLock(ObjectReference akLockedRef, Bool abCrime, Bool abSucceeded, terminalmenu akLockedTerminalMenu, Int aiTerminalMenuItem)
  If (akLockedRef == ZooTerminal.GetRef() || akLockedRef == ArmoryTerminal.GetRef()) && abCrime == True
    Actor PlayerRef = Game.GetPlayer()
    If ZooAreaGuard01.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || ZooAreaGuard02.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || ZooAreaGuard03.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || CaptainPetrov.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference)
      PlayerRef.RemoveFromFaction(MQ202PetrovFaction)
      PlayerRef.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
      PlayerRef.RemoveFromFaction(MQ202PetrovBoardingFaction)
      MQ202PetrovTerminalsFaction.SetEnemy(PlayerFaction, False, False)
      MQ202PetrovGuardsFaction.SetEnemy(PlayerFaction, False, False)
      MQ202PetrovFaction.SetEnemy(PlayerFaction, False, False)
    EndIf
  EndIf
EndEvent
