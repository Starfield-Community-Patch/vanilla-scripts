ScriptName TestAddSkillOnActivateScript Extends ObjectReference Const
{ adds a skill on activate for testing }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PerkToAdd Auto Const mandatory
conditionform Property AddPerkCondition Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If AddPerkCondition as Bool && AddPerkCondition.IsTrue(Game.GetPlayer() as ObjectReference, None)
      Game.GetPlayer().AddPerk(PerkToAdd, False)
    EndIf
  EndIf
EndEvent
