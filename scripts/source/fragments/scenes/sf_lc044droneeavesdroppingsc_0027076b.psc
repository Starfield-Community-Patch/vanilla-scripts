ScriptName Fragments:Scenes:SF_LC044DRONEEavesdroppingSc_0027076B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Minibot Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  Minibot.getactorref().SetUnconscious(False)
EndFunction
