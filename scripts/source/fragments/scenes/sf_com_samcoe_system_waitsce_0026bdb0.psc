ScriptName Fragments:Scenes:SF_COM_SamCoe_System_WaitSce_0026BDB0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.WaitSceneEnded()
EndFunction
