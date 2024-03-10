ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG03_001C6E1A Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_22_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
