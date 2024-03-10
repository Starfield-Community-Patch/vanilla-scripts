ScriptName Fragments:Quests:QF_TestCFOutfit_003EA3D7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Delgado Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ActorBase Property RokovBase Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
ReferenceAlias Property Alias_SysDef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_SysDef.GetRef().DisableNoWait(False)
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)
  Alias_Delgado.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Mathis.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Naeva.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Estelle.GetRef().EnableNoWait(False)
  Alias_Estelle.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Huan.GetRef().EnableNoWait(False)
  Alias_Huan.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Adler.GetRef().EnableNoWait(False)
  Alias_Adler.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Rokov.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False)
  Alias_Rokov.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Rokov.GetRef().DisableNoWait(False)
  Alias_Rokov.GetRef().EnableNoWait(False)
EndFunction
