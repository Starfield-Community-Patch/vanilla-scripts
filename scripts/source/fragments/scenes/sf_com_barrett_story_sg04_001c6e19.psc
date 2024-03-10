ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG04_001C6E19 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_20_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
