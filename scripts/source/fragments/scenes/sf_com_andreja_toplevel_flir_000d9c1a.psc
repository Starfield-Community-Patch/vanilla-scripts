ScriptName Fragments:Scenes:SF_COM_Andreja_TopLevel_Flir_000D9C1A Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_06_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.FlirtSceneEnded()
EndFunction
