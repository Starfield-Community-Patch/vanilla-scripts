ScriptName Fragments:Scenes:SF_COM_SamCoe_System_GiveIte_000DF498 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.GiveItemSceneEnded()
EndFunction
