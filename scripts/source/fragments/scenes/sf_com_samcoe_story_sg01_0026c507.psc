ScriptName Fragments:Scenes:SF_COM_SamCoe_Story_SG01_0026C507 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_10_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
