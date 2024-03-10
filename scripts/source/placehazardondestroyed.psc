ScriptName PlaceHazardOnDestroyed Extends ObjectReference Const
{ Places the selected hazard when this reference is destroyed. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Hazard Property HazardToPlace Auto Const mandatory
Float Property xOffset = 0.0 Auto Const
Float Property yOffset = 0.0 Auto Const
Float Property zOffset = 0.0 Auto Const
Bool Property SnapOffsetToNavmesh = False Auto Const

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akDestroyer)
  Float[] Offset = new Float[3]
  Offset[0] = xOffset
  Offset[1] = yOffset
  Offset[2] = zOffset
  Self.PlaceAtMe(HazardToPlace as Form, 1, False, False, True, Offset, None, SnapOffsetToNavmesh)
EndEvent
