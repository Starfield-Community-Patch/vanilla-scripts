ScriptName DefaultCollectionAliasAddPerkOnLoad Extends RefCollectionAlias Const default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PerkToAdd Auto Const
{ The perk that should be added to actors in the collection upon load. }

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  If akSenderRef as Actor != None
    (akSenderRef as Actor).AddPerk(PerkToAdd, False)
  EndIf
EndEvent
