ScriptName CF06QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const mandatory
Cell Property CityNeonTradeTowerAstralLounge Auto Const mandatory
Int Property iStageToMoveBayu Auto Const mandatory
Int Property iStageDoneWithBayu Auto Const mandatory
ReferenceAlias Property CF06_BenjaminBayu Auto Const mandatory
ReferenceAlias Property CF06_AstralLoungeBayuMarker Auto Const mandatory
ReferenceAlias Property CF06_AstralLoungeLoadDoor Auto Const mandatory
ActorValue Property Assistance Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory

;-- Functions ---------------------------------------

Function StartGetOffPlanetTimer()
  Self.StartTimerGameTime(2.0, 0)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.SetStage(450)
EndEvent

Function CallNeonCrime()
  CrimeFactionNeon.ModCrimeGold(10000, False)
EndFunction

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer()
    If Self.GetStageDone(iStageToMoveBayu) && !Self.GetStageDone(iStageDoneWithBayu)
      If akNewLoc == CityNeonTradeTowerAstralLoungeLocation
        Actor BayuRef = CF06_BenjaminBayu.GetActorRef()
        BayuRef.MoveTo(CF06_AstralLoungeBayuMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
        BayuRef.SetValue(Assistance, 0.0)
        BayuRef.SetValue(Confidence, 0.0)
        ObjectReference DoorRef = CF06_AstralLoungeLoadDoor.GetRef()
        DoorRef.SetFactionOwner(PlayerFaction, False)
        DoorRef.Lock(True, False, True)
        DoorRef.SetLockLevel(254)
        CityNeonTradeTowerAstralLounge.EnableFastTravel(False)
      EndIf
      If akOldLoc == CityNeonTradeTowerAstralLoungeLocation
        Self.ReleasePlayer()
      EndIf
    EndIf
  EndIf
EndEvent

Function ReleasePlayer()
  ObjectReference DoorRef = CF06_AstralLoungeLoadDoor.GetRef()
  DoorRef.Lock(False, False, True)
  DoorRef.SetFactionOwner(None, False)
  CityNeonTradeTowerAstralLounge.EnableFastTravel(True)
  CF06_BenjaminBayu.GetActorRef().SetValue(Assistance, 1.0)
  CF06_BenjaminBayu.GetActorRef().SetValue(Confidence, 2.0)
EndFunction
