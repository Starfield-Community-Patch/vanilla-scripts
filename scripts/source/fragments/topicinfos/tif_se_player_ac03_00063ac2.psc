ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063AC2 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Platinum Auto Const
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  spaceshipreference ShipRef = Alias_PlayerShip.GetShipRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  Int CargoShipParts = ShipRef.GetItemCount(Platinum as Form)
  Int PlayerShipParts = PlayerRef.GetItemCount(Platinum as Form)
  If CargoShipParts >= 5
    ShipRef.RemoveItem(Platinum as Form, 5, False, None)
  Else
    Int NumberOfPartsRemoved = ShipRef.RemoveItem(Platinum as Form, CargoShipParts, False, None)
    Int RemainingPartRemoval = 5 - NumberOfPartsRemoved
    PlayerRef.RemoveItem(Platinum as Form, RemainingPartRemoval, False, None)
  EndIf
EndFunction
