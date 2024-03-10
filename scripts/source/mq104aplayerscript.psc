ScriptName MQ104APlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PlayerPowerPrereqStage = 710 Auto Const
Int Property PlayerPowerSetStage = 720 Auto Const
Spell Property PlayerFirstPower Auto Const mandatory
Location Property CityNewAtlantisLodgeLocation Auto Const

;-- Functions ---------------------------------------

Event OnSpellCast(Form akSpell)
  If (akSpell == PlayerFirstPower as Form) && Game.GetPlayer().IsInLocation(CityNewAtlantisLodgeLocation)
    Quest MyQuest = Self.GetOwningQuest()
    If MyQuest.GetStageDone(PlayerPowerPrereqStage) && MyQuest.GetStageDone(PlayerPowerSetStage) == False
      MyQuest.SetStage(PlayerPowerSetStage)
    EndIf
  EndIf
EndEvent
