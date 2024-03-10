ScriptName Fragments:Scenes:SF_MQ302_100_Space_InitialCo_00187143 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_07_End()
  lc165spacequestscript kmyQuest = Self.GetOwningQuest() as lc165spacequestscript
  kmyQuest.ForceCloakStarbornShips()
EndFunction

Function Fragment_Phase_09_End()
  lc165spacequestscript kmyQuest = Self.GetOwningQuest() as lc165spacequestscript
  kmyQuest.ForceCloakStarbornShips()
EndFunction
