ScriptName Fragments:Quests:QF_RI_RadiantPointerQuest_000C41A3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Quest Property RIR06 Auto Const mandatory
Quest Property RIR07 Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_PointerQuestGiverFurniture Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue()
  If fQuestGiver == 1.0
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
  ElseIf fQuestGiver == 2.0
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  EndIf
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False)
  If RI05_ImogeneDead.GetValueInt() == 0 && RI05_Track_PlayerSidedWithMasako.GetValueInt() == 1
    Alias_Imogene.GetRef().MoveTo(Alias_PointerQuestGiverFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
  Else
    Alias_Yuko.GetRef().MoveTo(Alias_PointerQuestGiverFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Imogene.GetActorRef().EvaluatePackage(False)
  Alias_Yuko.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.Stop()
EndFunction
