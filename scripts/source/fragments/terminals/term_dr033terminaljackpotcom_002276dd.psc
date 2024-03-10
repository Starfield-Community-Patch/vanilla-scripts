ScriptName Fragments:Terminals:TERM_DR033TerminalJackpotCom_002276DD Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
GlobalVariable Property CreditsRewardRadiantQuestLarge Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  Game.GetPlayer().AddItem(Credits as Form, CreditsRewardRadiantQuestLarge.getvalue() as Int, False)
EndFunction
