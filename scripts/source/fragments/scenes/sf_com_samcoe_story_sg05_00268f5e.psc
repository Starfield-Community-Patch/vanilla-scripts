ScriptName Fragments:Scenes:SF_COM_SamCoe_Story_SG05_00268F5E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_21_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
