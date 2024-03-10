ScriptName TestPlaceAliasRelativeToPlayerShip Extends ReferenceAlias
{ OnAliasInit, places this alias relative to the player's ship. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AliasProperties
  Bool Property ShouldEnableAfterPlaced = True Auto Const
EndGroup

Group AutofillProperties collapsedonbase
  ReferenceAlias Property PlayerShip Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Float[] offsets = new Float[6]
  offsets[0] = 0.0
  offsets[1] = 100.0
  offsets[2] = 0.0
  offsets[5] = 0.0
  ObjectReference marker = PlayerShip.GetRef().PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True)
  ObjectReference myRef = Self.GetRef()
  myRef.MoveTo(marker, 0.0, 0.0, 0.0, True, False)
  marker.Delete()
  If ShouldEnableAfterPlaced
    myRef.EnableNoWait(False)
  EndIf
EndEvent
