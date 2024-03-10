ScriptName Fragments:Scenes:SF_MQ204A_013_HunterScene01a_0010D8C5 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ204_Well_HunterAppearsMarker Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
ReferenceAlias Property Hunter Auto Const
Spell Property LC165_Starborn_Fire_ScriptedQuantumEssenceSpell Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  MQ204_Well_HunterAppearsMarker.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
EndFunction

Function Fragment_Phase_01_End()
  Actor HunterREF = Hunter.GetActorRef()
  AbStarbornTeleport.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference)
EndFunction
