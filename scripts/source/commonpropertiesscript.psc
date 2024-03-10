ScriptName CommonPropertiesScript Extends Quest Const
{ Access these properties like this from any script without having set up any properties:
Game.GetCommonProperties().PropertyName }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Keywords
  Keyword Property ActorTypeNPC Auto Const mandatory
  Keyword Property ActorTypeSuperMutant Auto Const mandatory
  Keyword Property WeaponTypeMelee1H Auto Const mandatory
  Keyword Property WeaponTypeMelee2H Auto Const mandatory
  Keyword Property WeaponTypeUnarmed Auto Const mandatory
  Keyword Property AnimArchetypeConfident Auto Const mandatory
  Keyword Property AnimArchetypeDepressed Auto Const mandatory
  Keyword Property AnimArchetypeElderly Auto Const mandatory
  Keyword Property AnimArchetypeFriendly Auto Const mandatory
  Keyword Property AnimArchetypeIrritated Auto Const mandatory
  Keyword Property AnimArchetypeNervous Auto Const mandatory
  Keyword Property CA__CustomEvent_Generous Auto Const mandatory
  Keyword Property CA__CustomEvent_Mean Auto Const mandatory
  Keyword Property CA__CustomEvent_Nice Auto Const mandatory
  Keyword Property CA__CustomEvent_Peaceful Auto Const mandatory
  Keyword Property CA__CustomEvent_PeacefulFailed Auto Const mandatory
  Keyword Property CA__CustomEvent_Selfish Auto Const mandatory
  Keyword Property CA__CustomEvent_Violent Auto Const mandatory
  Keyword Property CA__Event_DonateItem Auto Const mandatory
  Keyword Property CA__Event_ReceiveReward Auto Const mandatory
  Keyword Property CA__Event_SpeechForMoreCaps Auto Const mandatory
  Keyword Property CA__Event_Murder Auto Const mandatory
  Keyword Property DogAnimArchetypeAgitated Auto Const mandatory
  Keyword Property DogAnimArchetypeAlert Auto Const mandatory
  Keyword Property DogAnimArchetypePlayful Auto Const mandatory
  Keyword Property LocTypeSettlement Auto Const mandatory
  Keyword Property LocTypeWorkshopSettlement Auto Const mandatory
EndGroup

Group Actors
  Actor Property DogmeatRef Auto Const mandatory
  Actor Property CaitRef Auto Const mandatory
  Actor Property CodsworthRef Auto Const mandatory
  Actor Property CurieRef Auto Const mandatory
  Actor Property DanseRef Auto Const mandatory
  Actor Property DeaconRef Auto Const mandatory
  Actor Property HancockRef Auto Const mandatory
  Actor Property MacCreadyRef Auto Const mandatory
  Actor Property PiperRef Auto Const mandatory
  Actor Property PrestonRef Auto Const mandatory
  Actor Property StrongRef Auto Const mandatory
  Actor Property ValentineRef Auto Const mandatory
  Actor Property X688Ref Auto Const mandatory
EndGroup

Group ActorValues
  ActorValue Property CA_Affinity Auto Const mandatory
  ActorValue Property CA_CurrentThreshold Auto Const mandatory
  ActorValue Property FollowerDistance Auto Const mandatory
  ActorValue Property FollowerStance Auto Const mandatory
  ActorValue Property FollowerStanceAllowCombatOverride Auto Const mandatory
  ActorValue Property FollowerState Auto Const mandatory
  ActorValue Property IdleChatterTimeMax Auto Const mandatory
  ActorValue Property IdleChatterTimeMin Auto Const mandatory
  ActorValue Property LeftAttackCondition Auto Const mandatory
  ActorValue Property LeftMobilityCondition Auto Const mandatory
  ActorValue Property PerceptionCondition Auto Const mandatory
  ActorValue Property RightAttackCondition Auto Const mandatory
  ActorValue Property RightMobilityCondition Auto Const mandatory
EndGroup

Group Aliases
  ReferenceAlias Property DogmeatCompanion Auto Const mandatory
  { DogmeatCompanion in Followers quest }
EndGroup

Group Factions
  Faction Property PlayerFaction Auto Const mandatory
  Faction Property CurrentCompanionFaction Auto Const mandatory
EndGroup

Group Races
  Race Property DogmeatRace Auto Const
EndGroup

