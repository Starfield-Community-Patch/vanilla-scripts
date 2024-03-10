ScriptName MissionBoardSupplyActivatorScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_outpostcargolinkscript Property SQ_OutpostCargoLink Auto Const mandatory
Keyword Property LinkOutpostCargoLink Auto Const mandatory
{ keyword to find linked ref of my cargo link }
Keyword Property OutpostCargoLinkFueledKeyword Auto Const mandatory
{ keyword to find fueled cargo links }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  missionquestscript myQuest = Self.GetOwningQuest() as missionquestscript
  If myQuest.PlayerAcceptedQuest
    If akActionRef == Game.GetPlayer() as ObjectReference
      ObjectReference myCargoLink = Self.GetRef().GetLinkedRef(LinkOutpostCargoLink)
      If myCargoLink
        Self.RegisterForRemoteEvent(myCargoLink as ScriptObject, "OnWorkshopCargoLinkChanged")
        myCargoLink.ShowWorkshopTargetMenu(True, None, True, OutpostCargoLinkFueledKeyword)
      EndIf
    EndIf
  EndIf
EndEvent

Event ObjectReference.OnWorkshopCargoLinkChanged(ObjectReference akSource, ObjectReference akOldTarget, ObjectReference akNewTarget)
  If akNewTarget == None
    (Self.GetOwningQuest() as missionsupplyscript).CargoLinkCleared()
  ElseIf akNewTarget != akOldTarget
    (Self.GetOwningQuest() as missionsupplyscript).CargoLinkEstablished(akNewTarget)
  EndIf
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
  (Self.GetOwningQuest() as missionsupplyscript).CargoLinkCleared()
EndEvent
