ScriptName Fragments:Quests:QF_MQ101LandingEncounter01_00068EA8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AllPiratesRefColl Auto Const mandatory
ReferenceAlias Property Alias_Pirate01 Auto Const mandatory
ReferenceAlias Property Alias_Pirate02 Auto Const mandatory
ReferenceAlias Property Alias_Pirate03 Auto Const mandatory
ReferenceAlias Property Alias_Pirate04 Auto Const mandatory
ReferenceAlias Property Alias_Pirate05 Auto Const mandatory
ReferenceAlias Property Alias_Pirate06 Auto Const mandatory
ReferenceAlias Property Alias_Pirate07 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_Pirate01.GetRef().EnableNoWait(False)
  Alias_Pirate02.GetRef().EnableNoWait(False)
  Alias_Pirate03.GetRef().EnableNoWait(False)
  Alias_Pirate04.GetRef().EnableNoWait(False)
  Alias_Pirate05.GetRef().EnableNoWait(False)
  Alias_Pirate06.GetRef().EnableNoWait(False)
  Alias_Pirate07.GetRef().EnableNoWait(False)
  Actor player = Game.GetPlayer()
  Alias_Pirate01.GetActorRef().StartCombat(player as ObjectReference, False)
  Alias_Pirate02.GetActorRef().StartCombat(player as ObjectReference, False)
  Alias_Pirate03.GetActorRef().StartCombat(player as ObjectReference, False)
  Alias_Pirate04.GetActorRef().StartCombat(player as ObjectReference, False)
  Alias_Pirate05.GetActorRef().StartCombat(player as ObjectReference, False)
  Alias_Pirate06.GetActorRef().StartCombat(player as ObjectReference, False)
  Alias_Pirate07.GetActorRef().StartCombat(player as ObjectReference, False)
EndFunction
