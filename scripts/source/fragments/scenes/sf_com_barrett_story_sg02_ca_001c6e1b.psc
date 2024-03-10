ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG02_Ca_001C6E1B Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_18_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
