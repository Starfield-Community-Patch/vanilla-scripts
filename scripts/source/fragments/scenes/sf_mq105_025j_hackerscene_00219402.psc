ScriptName Fragments:Scenes:SF_MQ105_025j_HackerScene_00219402 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property FrostedGlassTrigger Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  FrostedGlassTrigger.GetRef().Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction
