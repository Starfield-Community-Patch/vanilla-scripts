ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG08_Co_00136DC1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_17_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
