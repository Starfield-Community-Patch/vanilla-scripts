ScriptName Fragments:Perks:PRKF_RI_BountyTrackingPerk_002AEE3B Extends Perk Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_Support Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Quest Property RIR07 Auto Const mandatory
Quest Property RI02 Auto Const mandatory
Quest Property RI03 Auto Const mandatory
Quest Property RI04 Auto Const mandatory
Quest Property RI06 Auto Const mandatory
Quest Property RI07 Auto Const mandatory
Quest Property MB_Hack01_RIR01 Auto Const mandatory
Quest Property MB_PlantEvidence01_RIR02 Auto Const mandatory
Quest Property MB_Sabotage01_RIR04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR01)
EndFunction

Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR02)
EndFunction

Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR03)
EndFunction

Function Fragment_Entry_03(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR04)
EndFunction

Function Fragment_Entry_04(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR05)
EndFunction

Function Fragment_Entry_05(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR07)
EndFunction

Function Fragment_Entry_06(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI02)
EndFunction

Function Fragment_Entry_07(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI03)
EndFunction

Function Fragment_Entry_08(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI04)
EndFunction

Function Fragment_Entry_09(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI06)
EndFunction

Function Fragment_Entry_10(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI07)
EndFunction

Function Fragment_Entry_11(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(MB_Hack01_RIR01)
EndFunction

Function Fragment_Entry_12(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(MB_PlantEvidence01_RIR02)
EndFunction

Function Fragment_Entry_13(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(MB_Sabotage01_RIR04)
EndFunction
