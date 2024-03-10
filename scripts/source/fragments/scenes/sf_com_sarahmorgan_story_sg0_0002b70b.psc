ScriptName Fragments:Scenes:SF_COM_SarahMorgan_Story_SG0_0002B70B Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_24_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
