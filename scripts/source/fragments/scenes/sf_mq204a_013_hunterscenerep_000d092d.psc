ScriptName Fragments:Scenes:SF_MQ204A_013_HunterSceneRep_000D092D Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ204_Well_HunterAppearsMarker Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  mq204script kmyQuest = Self.GetOwningQuest() as mq204script
  kmyQuest.HunterWarpEnds()
EndFunction
