ScriptName Fragments:Scenes:SF_COM_SamCoe_Story_SG03_00268F5F Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_12_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
