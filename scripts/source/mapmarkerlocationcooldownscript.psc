ScriptName MapMarkerLocationCooldownScript Extends ObjectReference Const
{ script sets a cooldown global when the player discovers this location }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property LocationCooldown Auto Const mandatory
{ holds the cooldown time for this location - this needs to be on a cooldown condition for this location in the PCM }
Float Property cooldownDays = 2.0 Auto Const
{ how many days before allowing the PCM to place this location again? }

;-- Functions ---------------------------------------

Event OnMapMarkerDiscovered()
  LocationCooldown.SetValue(Utility.GetCurrentGameTime() + cooldownDays)
EndEvent
