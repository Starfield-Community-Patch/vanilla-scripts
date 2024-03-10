ScriptName COM_Quest_Andreja_Q01_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int PlayerInShipStage = 210
Int ReadyForShipStage = 175

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myCOM_Andreja_Quest = Self.GetOwningQuest()
  spaceshipreference PlayerShipREF = PlayerShip.GetShipReference()
  If akShip == PlayerShipREF as ObjectReference
    If myCOM_Andreja_Quest.GetStageDone(ReadyForShipStage)
      myCOM_Andreja_Quest.SetStage(PlayerInShipStage)
    EndIf
  EndIf
EndEvent
