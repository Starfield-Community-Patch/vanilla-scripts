ScriptName Fragments:Scenes:SF_COM_SarahMorgan_System_Gi_002AA8A0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.GiveItemSceneEnded()
EndFunction
