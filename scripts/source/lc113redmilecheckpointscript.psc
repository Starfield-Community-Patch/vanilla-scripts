ScriptName LC113RedMileCheckpointScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property QST_FC05_Beacon_Activation_WEF Auto Const
ObjectReference Property LC113_Checkpoint_Explosion Auto Const mandatory
Explosion Property FlameExplosion Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  LC113_Checkpoint_Explosion.PlaceAtMe(FlameExplosion as Form, 1, False, False, True, None, None, True)
  QST_FC05_Beacon_Activation_WEF.Play(LC113_Checkpoint_Explosion, None, None)
EndEvent
