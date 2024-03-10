ScriptName Fragments:Scenes:SF_COM_Andreja_System_GiveIt_000D9C15 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_06_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.GiveItemSceneEnded()
EndFunction
