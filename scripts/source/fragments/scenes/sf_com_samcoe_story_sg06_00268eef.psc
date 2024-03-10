ScriptName Fragments:Scenes:SF_COM_SamCoe_Story_SG06_00268EEF Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_13_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
