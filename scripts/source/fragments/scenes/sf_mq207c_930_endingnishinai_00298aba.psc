ScriptName Fragments:Scenes:SF_MQ207C_930_EndingNishinaI_00298ABA Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  mq207cshiftingquestscript kmyQuest = Self.GetOwningQuest() as mq207cshiftingquestscript
  kmyQuest.PlaySpecialEndingFadeOut()
EndFunction
