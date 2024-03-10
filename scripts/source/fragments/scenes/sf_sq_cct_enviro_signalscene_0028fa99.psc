ScriptName Fragments:Scenes:SF_SQ_CCT_Enviro_SignalScene_0028FA99 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  cct_enviro_behaviorscript kmyQuest = Self.GetOwningQuest() as cct_enviro_behaviorscript
  kmyQuest.ApplyBehaviorAbility(False)
EndFunction

Function Fragment_Phase_02_Begin()
  cct_enviro_behaviorscript kmyQuest = Self.GetOwningQuest() as cct_enviro_behaviorscript
  kmyQuest.ApplyBehaviorAbility(True)
EndFunction

Function Fragment_Phase_02_End()
  cct_enviro_behaviorscript kmyQuest = Self.GetOwningQuest() as cct_enviro_behaviorscript
  kmyQuest.ApplyBehaviorAbility(False)
EndFunction
