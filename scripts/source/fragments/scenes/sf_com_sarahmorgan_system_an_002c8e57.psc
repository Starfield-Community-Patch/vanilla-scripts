ScriptName Fragments:Scenes:SF_COM_SarahMorgan_System_An_002C8E57 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_09_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.AngerSpeechChallengeSuccess()
EndFunction

Function Fragment_Phase_12_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.AngerSceneCompleted()
EndFunction

Function Fragment_Phase_14_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.AngerSceneCompleted()
EndFunction
