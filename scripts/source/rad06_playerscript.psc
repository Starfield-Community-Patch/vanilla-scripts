ScriptName RAD06_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property QuestGiverLoc Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Quest MyQuest = Self.GetOwningQuest()
  If akNewLoc == QuestGiverLoc.GetLocation()
    (Self.GetOwningQuest() as rad06script).CargoHoldResourceCheck()
  EndIf
EndEvent
