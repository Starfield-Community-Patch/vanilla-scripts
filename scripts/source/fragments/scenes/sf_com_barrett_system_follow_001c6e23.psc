ScriptName Fragments:Scenes:SF_COM_Barrett_System_Follow_001C6E23 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.FollowSceneEnded()
EndFunction
