ScriptName Fragments:Scenes:SF_COM_SamCoe_Story_SG07_Que_00222F45 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_18_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StartPersonalQuest()
EndFunction
