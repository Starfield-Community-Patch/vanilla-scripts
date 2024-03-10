ScriptName MQ204Script Extends Quest

;-- Variables ---------------------------------------
Int NumRescueAtEyeCount
Int NumRescueAtEyeTotal = 4
Int NumRescueAtLodgeCount
Int NumRescueAtLodgeTotal = 4

;-- Properties --------------------------------------
inputenablelayer Property MQ204EnableLayer Auto hidden
Faction Property CurrentCompanionFaction Auto Const mandatory
Message Property MQ204MedStimMSG Auto Const mandatory
ActorValue Property Health Auto Const mandatory
Int Property RescuedEyeStage = 390 Auto Const
Int Property RescuedLodgeStage = 470 Auto Const
Location Property StarStationTheEyeLocation Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const mandatory
Keyword Property AnimFaceArchetypeInPain Auto Const mandatory
ReferenceAlias Property TheHunter Auto Const mandatory
Scene Property MQ204A_013_HunterSceneRepeat Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property EyeMarker Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToMale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_MaleReactsToFemale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_FemaleReactsToMale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToFemale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale Auto Const mandatory
Keyword Property MQ204A_030_MaleVictim Auto Const mandatory
Keyword Property MQ204A_030_FemaleVictim Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.SetStage(10)
EndEvent

Function SetDeathFurnitureKeywords(Actor akVictim, Actor akSurvivor, ObjectReference akFurniture)
  Actor AndrejaREF = Andreja.GetActorRef()
  Actor BarrettREF = Barrett.GetActorRef()
  Actor SamCoeREF = SamCoe.GetActorRef()
  Actor SarahMorganREF = SarahMorgan.GetActorRef()
  If akVictim == SarahMorganREF || akVictim == AndrejaREF
    If akSurvivor == SarahMorganREF || akSurvivor == AndrejaREF
      akVictim.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale)
      akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale)
    Else
      akVictim.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToMale)
      akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_MaleReactsToFemale)
    EndIf
  ElseIf akSurvivor == SarahMorganREF || akSurvivor == AndrejaREF
    akVictim.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToFemale)
    akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_FemaleReactsToMale)
  Else
    akVictim.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale)
    akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale)
  EndIf
EndFunction

Function RescuedActor(Actor AkActorREF)
  If AkActorREF.IsInLocation(StarStationTheEyeLocation)
    Self.CheckEyeActors()
  Else
    Self.CheckLodgeActors()
  EndIf
  If AkActorREF != MQ00_CompanionWhoDies.GetActorRef()
    AkActorREF.SetGhost(False)
  EndIf
  AkActorREF.SetActivateTextOverride(None)
EndFunction

Function CheckEyeActors()
  NumRescueAtEyeCount += 1
  If NumRescueAtEyeCount == NumRescueAtEyeTotal
    Self.SetStage(RescuedEyeStage)
  EndIf
EndFunction

Function CheckLodgeActors()
  NumRescueAtLodgeCount += 1
  If NumRescueAtLodgeCount == NumRescueAtLodgeTotal
    Self.SetStage(RescuedLodgeStage)
  EndIf
EndFunction

Function SetActorHunterAttacked(Actor AkActorREF, Bool bMoveToEye)
  AkActorREF.SetActivateTextOverride(MQ204MedStimMSG)
  AkActorREF.SetGhost(True)
  AkActorREF.ChangeAnimFaceArchetype(AnimFaceArchetypeInPain)
EndFunction

Function MQ204MoveActor(Actor AkActorREF, ObjectReference akMoveMarker)
  If AkActorREF.IsInLocation(akMoveMarker.GetCurrentLocation())
    
  ElseIf AkActorREF.IsDead()
    
  Else
    AkActorREF.Disable(False)
    AkActorREF.Moveto(akMoveMarker, 0.0, 0.0, 0.0, True, False)
    AkActorREF.EvaluatePackage(False)
    AkActorREF.Enable(False)
  EndIf
EndFunction

Function SetActorInBleedOut(Actor AkActorREF)
  AkActorREF.SetNoBleedoutRecovery(True)
  AkActorREF.AllowBleedoutDialogue(True)
  AkActorREF.DamageValue(Health, 9999.0)
EndFunction

Function SetActorRecovered(Actor AkActorREF)
  AkActorREF.SetNoBleedoutRecovery(False)
  AkActorREF.AllowBleedoutDialogue(False)
  AkActorREF.RestoreValue(Health, 9999.0)
EndFunction

Function PlayerReceivesArtifacts()
  Actor PlayerREF = Game.GetPlayer()
  Int currentElement = 0
  While currentElement < MQ00_ArtifactsHolder.GetCount()
    PlayerREF.additem(MQ00_ArtifactsHolder.GetAt(currentElement) as Form, 1, False)
    currentElement += 1
  EndWhile
EndFunction

Function HunterWarps(ObjectReference akMarkerREF)
  Actor HunterREF = TheHunter.GetActorRef()
  Actor PlayerREF = Game.GetPlayer()
  If HunterREF.GetDistance(PlayerREF as ObjectReference) > 5.0
    akMarkerREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
    HunterREF.Moveto(akMarkerREF, 0.0, 0.0, 0.0, True, False)
    AbStarbornTeleport.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference)
    MQ204A_013_HunterSceneRepeat.Start()
  EndIf
EndFunction

Function HunterWarpEnds()
  Actor HunterREF = TheHunter.GetActorRef()
  Actor PlayerREF = Game.GetPlayer()
  HunterREF.EvaluatePackage(False)
  HunterREF.StartCombat(PlayerREF as ObjectReference, True)
EndFunction
