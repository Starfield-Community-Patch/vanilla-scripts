ScriptName setOutfitForRefAlias Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Outfit Property OutfitToEquip Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.getActorReference().setOutfit(OutfitToEquip, False)
EndEvent
