ScriptName Fragments:Scenes:SF_TestChargenLoadScene_000FE2D8 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CharGenFurniture Auto Const
ReferenceAlias Property CharacterGenFurniture Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  Game.GetPlayer().SnapIntoInteraction(CharGenFurniture.GetRef())
EndFunction
