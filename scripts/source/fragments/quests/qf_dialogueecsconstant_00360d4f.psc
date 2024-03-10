ScriptName Fragments:Quests:QF_DialogueECSConstant_00360D4F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BomaniRida Auto Const mandatory
ReferenceAlias Property Alias_DianaBrackenridge Auto Const mandatory
ReferenceAlias Property Alias_MabhutiDaCosta Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard01 Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard02 Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard03 Auto Const mandatory
ReferenceAlias Property Alias_DianaIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_BomaniIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MabhutiIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_DianaBridgeMarker01 Auto Const mandatory
ReferenceAlias Property Alias_BomaniBridgeMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MabhutiHomeMarker01 Auto Const mandatory
Scene Property DialogueECS_Establishing01 Auto Const mandatory
Scene Property DialogueECS_Establishing02 Auto Const
Scene Property DialogueECS_Establishing03 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_DianaBrackenridge.GetRef().MoveTo(Alias_DianaIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_BomaniRida.GetRef().MoveTo(Alias_BomaniIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_MabhutiDaCosta.GetRef().MoveTo(Alias_MabhutiIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  DialogueECS_Establishing01.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  DialogueECS_Establishing01.Stop()
  DialogueECS_Establishing02.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  DialogueECS_Establishing03.Start()
EndFunction
