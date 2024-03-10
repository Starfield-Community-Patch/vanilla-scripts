ScriptName RMStockerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.GetActorRef().SetValue(ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV, 1.0)
EndEvent
