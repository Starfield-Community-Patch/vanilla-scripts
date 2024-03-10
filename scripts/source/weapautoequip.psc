ScriptName WeapAutoEquip Extends ObjectReference

;-- Variables ---------------------------------------
Form WeaponToEquip

;-- Properties --------------------------------------
GlobalVariable Property WeaponHasAutoEquipped Auto Const
Int Property FavoriteSlot = -1 Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  WeaponToEquip = Self.GetBaseObject()
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  If akNewContainer == Game.GetPlayer() as ObjectReference
    If WeaponHasAutoEquipped.GetValue() == 0.0
      WeaponHasAutoEquipped.SetValue(1.0)
      Game.GetPlayer().EquipItem(WeaponToEquip, False, False)
      Game.GetPlayer().MarkItemAsFavorite(WeaponToEquip, FavoriteSlot)
      Utility.wait(0.5)
      Game.GetPlayer().DrawWeapon()
    EndIf
  EndIf
EndEvent
