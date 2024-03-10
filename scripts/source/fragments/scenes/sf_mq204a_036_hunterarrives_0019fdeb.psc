ScriptName Fragments:Scenes:SF_MQ204A_036_HunterArrives_0019FDEB Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQ204_HunterWellMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  MQ204_HunterWellMarker.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
EndFunction
