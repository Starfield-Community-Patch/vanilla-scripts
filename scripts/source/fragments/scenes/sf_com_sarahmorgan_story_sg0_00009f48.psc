ScriptName Fragments:Scenes:SF_COM_SarahMorgan_Story_SG0_00009F48 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_23_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
