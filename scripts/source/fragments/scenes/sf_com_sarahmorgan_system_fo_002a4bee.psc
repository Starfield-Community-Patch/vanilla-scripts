ScriptName Fragments:Scenes:SF_COM_SarahMorgan_System_Fo_002A4BEE Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.FollowSceneEnded()
EndFunction
