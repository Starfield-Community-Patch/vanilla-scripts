ScriptName BE_SC04QuestScript Extends Quest
{ Script for BE_SC04, Bargaining. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties collapsedonbase
  ReferenceAlias Property Captain Auto Const mandatory
  ReferenceAlias Property CaptainEssentialAlias Auto Const mandatory
  ReferenceAlias Property TargetShip Auto Const mandatory
  ReferenceAlias Property TargetShipJumpTravelMarker Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  ((Self as Quest) as bescript).WaitUntilInitialized()
  CaptainEssentialAlias.ForceRefTo(Captain.GetRef())
EndEvent

Function SpawnJumpTravelMarker()
  spaceshipreference targetShipRef = TargetShip.GetRef() as spaceshipreference
  Float[] offset = new Float[6]
  offset[0] = 250.0
  TargetShipJumpTravelMarker.ForceRefTo(targetShipRef.PlaceAtMe(XMarker as Form, 1, False, False, True, offset, None, True))
  targetShipRef.EvaluatePackage(False)
EndFunction
