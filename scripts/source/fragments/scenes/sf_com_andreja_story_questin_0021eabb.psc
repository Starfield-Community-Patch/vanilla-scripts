ScriptName Fragments:Scenes:SF_COM_Andreja_Story_QuestIn_0021EABB Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_12_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StartPersonalQuest()
EndFunction
