ScriptName Fragments:Scenes:SF_COM_Andreja_System_WaitSc_0023B32D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.WaitSceneEnded()
EndFunction
