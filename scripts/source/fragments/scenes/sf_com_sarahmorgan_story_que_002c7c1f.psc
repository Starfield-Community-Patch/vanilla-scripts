ScriptName Fragments:Scenes:SF_COM_SarahMorgan_Story_Que_002C7C1F Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_23_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.StartPersonalQuest()
EndFunction
