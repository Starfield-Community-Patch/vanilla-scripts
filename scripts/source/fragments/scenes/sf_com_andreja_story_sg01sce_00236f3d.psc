ScriptName Fragments:Scenes:SF_COM_Andreja_Story_SG01Sce_00236F3D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_19_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
