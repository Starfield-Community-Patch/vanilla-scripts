ScriptName Fragments:Scenes:SF_MQ207C_930_EndingNishinaI_00024BC0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  mq207cshiftingquestscript kmyQuest = Self.GetOwningQuest() as mq207cshiftingquestscript
  kmyQuest.PlaySpecialEndingFadeIn()
EndFunction
