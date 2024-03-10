ScriptName Fragments:Scenes:SF_COM_Barrett_TopLevel_Give_0014A9F1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.GiveItemSceneEnded()
EndFunction
