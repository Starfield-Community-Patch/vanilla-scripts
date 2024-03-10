ScriptName Fragments:Quests:QF_SE_Player_AC02_000850F3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property MoaraPostHailScene Auto Const
ReferenceAlias Property Moara Auto Const
ReferenceAlias Property PlayerShip Auto Const
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.wait(5.0)
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
  Alias_MapMarker.GetRef().DisableNoWait(False)
  If Moara.GetActorRef().GetCurrentShipRef() as ObjectReference == PlayerShip.GetRef()
    Self.SetStage(400)
  Else
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  MoaraPostHailScene.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
