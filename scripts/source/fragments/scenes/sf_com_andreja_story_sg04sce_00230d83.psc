ScriptName Fragments:Scenes:SF_COM_Andreja_Story_SG04Sce_00230D83 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_18_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
