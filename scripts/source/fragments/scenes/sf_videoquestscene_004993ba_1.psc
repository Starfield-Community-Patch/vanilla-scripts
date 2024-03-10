ScriptName Fragments:Scenes:SF_VideoQuestScene_004993BA_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoDoor Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  VideoDoor.GetRef().SetOpen(True)
EndFunction
