ScriptName Fragments:Scenes:SF_COM_Andreja_Story_SG03Sce_00230D81 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_13_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
