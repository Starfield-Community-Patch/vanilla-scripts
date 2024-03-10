ScriptName Fragments:Quests:QF_SE_CL02_0012E145 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property bagMan Auto Const
Scene Property bagMan_Hail Auto Const
spaceshipreference Property Alias_bagMan Auto Const
ReferenceAlias Property Alias_Player Auto Const
ReferenceAlias Property Alias_Beacon Auto Const mandatory
Message Property SE_CL02Message Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0020_Item_00()
  SE_CL02Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Alias_Beacon.GetRef().BlockActivation(True, False)
  Utility.wait(4.0)
  bagMan.GetShipRef().EnableWithGravJump()
  If bagMan.GetShipRef().WaitFor3DLoad()
    bagMan.GetShipRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Utility.wait(1.299999952)
  bagMan_Hail.Start()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Utility.wait(4.0)
  bagMan.GetShipRef().DisableWithGravJump()
EndFunction

Function Fragment_Stage_0060_Item_00()
  bagMan.GetShipRef().StartCombat(Alias_Player.GetShipRef(), False)
EndFunction
