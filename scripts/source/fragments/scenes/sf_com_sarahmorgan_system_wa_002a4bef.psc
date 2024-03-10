ScriptName Fragments:Scenes:SF_COM_SarahMorgan_System_Wa_002A4BEF Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.WaitSceneEnded()
EndFunction
