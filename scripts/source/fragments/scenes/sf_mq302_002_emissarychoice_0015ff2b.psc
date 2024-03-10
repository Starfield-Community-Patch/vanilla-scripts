ScriptName Fragments:Scenes:SF_MQ302_002_EmissaryChoice_0015FF2B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  Alias_Hunter.GetActorRef().PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
EndFunction
