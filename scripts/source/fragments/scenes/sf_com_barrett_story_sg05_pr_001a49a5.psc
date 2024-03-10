ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG05_Pr_001A49A5 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_20_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StartPersonalQuest()
EndFunction
