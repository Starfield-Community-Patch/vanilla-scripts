ScriptName Fragments:Scenes:SF_COM_Andreja_Story_SG02Sce_00230D82 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_17_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
