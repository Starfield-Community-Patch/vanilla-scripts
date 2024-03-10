ScriptName Fragments:Quests:QF_RIR03_01000984 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
Actor Property RI_Imogene Auto Const mandatory
Actor Property RI_Masako Auto Const mandatory
Actor Property RI_Ularu Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
MiscObject Property RIR03_Keycard Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_Keycard Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue()
  If fQuestGiver == 0.0
    Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef())
  ElseIf fQuestGiver == 1.0
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
  ElseIf fQuestGiver == 2.0
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Game.GetPlayer().AddItem(Alias_Keycard.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Keycard.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.Stop()
EndFunction
