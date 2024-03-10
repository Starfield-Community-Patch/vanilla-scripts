ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063A8F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Vanadium Auto Const
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  spaceshipreference ShipRef = Alias_PlayerShip.GetShipRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  Int CargoShipParts = ShipRef.GetItemCount(Vanadium as Form)
  Int PlayerShipParts = PlayerRef.GetItemCount(Vanadium as Form)
  If CargoShipParts >= 5
    ShipRef.RemoveItem(Vanadium as Form, 5, False, None)
  Else
    Int NumberOfPartsRemoved = ShipRef.RemoveItem(Vanadium as Form, CargoShipParts, False, None)
    Int RemainingPartRemoval = 5 - NumberOfPartsRemoved
    PlayerRef.RemoveItem(Vanadium as Form, RemainingPartRemoval, False, None)
  EndIf
EndFunction
