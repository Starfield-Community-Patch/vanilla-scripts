ScriptName Fragments:Perks:PRKF_SQ_Wounded_PlayerRescue_0071FFC8 Extends Perk Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_captivescript Property SQ_Captive Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  SQ_Captive.SendCaptiveSetFree(akTargetRef as Actor, True, False)
EndFunction

Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
  SQ_Captive.SendCaptiveSetFree(akTargetRef as Actor, True, True)
EndFunction
