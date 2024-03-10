ScriptName Fragments:Scenes:SF_COM_SamCoe_Story_SG04_00268EF0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_11_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
