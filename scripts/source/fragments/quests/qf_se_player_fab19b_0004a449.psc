ScriptName Fragments:Quests:QF_SE_Player_FAB19b_0004A449 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker03 Auto Const mandatory
GlobalVariable Property MS03_Outcome Auto Const mandatory
ReferenceAlias Property Alias_DestroyedShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_PatrolStartMarker03.GetRef()
  spaceshipreference oJuno = Alias_HailingShip.GetRef() as spaceshipreference
  oJuno.Enable(False)
  oJuno.MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
  oJuno.SetValue(DockingPermission, 4.0)
  If MS03_Outcome.GetValue() == 3.0
    Alias_DestroyedShip.GetRef().Disable(False)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
