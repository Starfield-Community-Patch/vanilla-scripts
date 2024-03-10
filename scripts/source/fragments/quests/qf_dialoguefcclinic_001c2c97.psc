ScriptName Fragments:Quests:QF_DialogueFCClinic_001C2C97 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Courier Auto Const mandatory
Quest Property DialogueFCClinic_IntroPost Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  DialogueFCClinic_IntroPost.Start()
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_Courier.GetReference().Disable(False)
EndFunction
