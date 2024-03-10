ScriptName Fragments:Scenes:SF_COM_SamCoe_System_AngerSc_0023EB63 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_06_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.AngerSpeechChallengeSuccess()
EndFunction

Function Fragment_Phase_09_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.AngerSceneCompleted()
EndFunction

Function Fragment_Phase_11_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.AngerSceneCompleted()
EndFunction
