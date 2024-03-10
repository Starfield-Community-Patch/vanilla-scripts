ScriptName Fragments:Quests:QF_LC039_00183F61 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0200_Item_00()
  If CF06.GetStageDone(125) == False
    CF06.Setstage(125)
  EndIf
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.Stop()
EndFunction
