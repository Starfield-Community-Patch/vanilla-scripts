ScriptName Fragments:Scenes:SF_MQ302_002_HunterChoice_0015FF27 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ReferenceAlias Property Alias_Emissary Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  Alias_Emissary.GetActorRef().PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
EndFunction
