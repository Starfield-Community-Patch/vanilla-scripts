ScriptName RQ_RescueScript Extends RQ_TransportPersonScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Rescue_Aliases
  ReferenceAlias Property Alias_Door Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_Victim Auto Const mandatory
  { autofill }
  RefCollectionAlias Property Alias_Actors Auto Const mandatory
  { autofill }
  RefCollectionAlias Property Alias_Passengers Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_CaptiveTarget Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_BossContainer Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_BonusContainer Auto Const mandatory
  { autofill }
  ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
  Int Property AllPassengersDisembarkStage = 500 Auto Const
  { this stage is set by passenger script when all passengers disembark OR unload }
EndGroup

Group Rescue_Scenes
  Scene Property CaptiveRescuedScene Auto Const mandatory
  { Scene to start when captive is rescued }
EndGroup

Group Rescue_PassengerHandling
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { autofill }
EndGroup


;-- Functions ---------------------------------------

Function InitializeNPCs()
  ObjectReference CaptiveMarker = Alias_CaptiveMarker.GetRef()
  ObjectReference DungeonMarker = Alias_BossContainer.GetRef()
  Actor CaptiveNPC = Alias_CaptiveTarget.GetActorRef()
  If CaptiveMarker
    CaptiveNPC.MoveTo(CaptiveMarker, 0.0, 0.0, 0.0, True, False)
  ElseIf DungeonMarker
    CaptiveNPC.MoveTo(DungeonMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  CaptiveNPC.Enable(False)
  CaptiveNPC.EvaluatePackage(False)
  CaptiveNPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1.0)
  Alias_BonusContainer.TryToEnable()
  Parent.InitializeNPCs()
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == AllPassengersDisembarkStage
    Int I = 0
    While I < Alias_Actors.GetCount()
      ObjectReference theActor = Alias_Actors.GetAt(I)
      If theActor.Is3DLoaded() == False
        theActor.DisableNoWait(False)
      EndIf
      I += 1
    EndWhile
    ObjectReference victimRef = Alias_Victim.GetRef()
    If victimRef.Is3DLoaded() == False
      victimRef.DisableNoWait(False)
    EndIf
  EndIf
EndEvent
