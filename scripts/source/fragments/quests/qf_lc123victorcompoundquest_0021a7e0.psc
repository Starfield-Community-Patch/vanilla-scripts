ScriptName Fragments:Quests:QF_LC123VictorCompoundQuest_0021A7E0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property LC123CoraMessage1 Auto Const
Message Property LC123CoraMessage2 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene1 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene2 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene3 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene4 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(5) == True
    LC123VictorCompoundQuest_CoraCommentScene1.Start()
  EndIf
EndFunction

Function Fragment_Stage_0015_Item_00()
  If Self.GetStageDone(5) == True
    LC123VictorCompoundQuest_CoraCommentScene4.Start()
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.GetStageDone(5) == True
    LC123VictorCompoundQuest_CoraCommentScene2.Start()
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.GetStageDone(5) == True
    LC123VictorCompoundQuest_CoraCommentScene3.Start()
  EndIf
EndFunction
