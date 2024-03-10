ScriptName Fragments:Scenes:SF_MQ204A_013_HunterScene01b_000DCCD6 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQ204_HunterWellAppears_Marker02 Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
ReferenceAlias Property Hunter Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  MQ204_HunterWellAppears_Marker02.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
EndFunction

Function Fragment_Phase_01_End()
  Actor HunterREF = Hunter.GetActorRef()
  AbStarbornTeleport.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference)
EndFunction
