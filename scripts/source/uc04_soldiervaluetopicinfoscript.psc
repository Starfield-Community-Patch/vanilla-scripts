ScriptName UC04_SoldierValueTopicInfoScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property FireTeamMarine Auto Const mandatory
{ Ref alias for the standard Fire Team Marine }
ReferenceAlias Property FireTeamMarineCaptain Auto Const mandatory
{ Ref alias for the Fire Team Marine Captain }
ActorValue Property UC04_SoldierPackageValue Auto Const mandatory
{ Actor value used to manage the team's behavior }
Int Property ActivityValue Auto Const mandatory
{ What value this topic should set on the marines }
Weapon Property WeaponToEquip Auto Const
{ If the soldier needs to equip a different weapon, have them do so here }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Actor MarineCaptain = FireTeamMarineCaptain.GetActorRef()
  Actor Marine = FireTeamMarine.GetActorRef()
  Marine.SetValue(UC04_SoldierPackageValue, ActivityValue as Float)
  MarineCaptain.SetValue(UC04_SoldierPackageValue, ActivityValue as Float)
  If WeaponToEquip != None && !MarineCaptain.IsEquipped(WeaponToEquip as Form)
    MarineCaptain.EquipItem(WeaponToEquip as Form, False, False)
  EndIf
  If WeaponToEquip != None && !Marine.IsEquipped(WeaponToEquip as Form)
    Marine.EquipItem(WeaponToEquip as Form, False, False)
  EndIf
  Marine.EvaluatePackage(False)
  MarineCaptain.EvaluatePackage(False)
EndEvent
