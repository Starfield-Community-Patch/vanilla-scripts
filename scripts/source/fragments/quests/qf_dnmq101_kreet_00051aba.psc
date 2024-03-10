ScriptName Fragments:Quests:QF_DNMQ101_Kreet_00051ABA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property ShelterPirates Auto Const
ObjectReference Property LandingDockPirates Auto Const
ObjectReference Property CafeteriaPirates Auto Const
ObjectReference Property Lab1Pirates Auto Const
ObjectReference Property Lab2Pirates Auto Const
ObjectReference Property RoofPirates Auto Const
ObjectReference Property RoofShipMarker Auto Const
ReferenceAlias Property Alias_LandingShip Auto Const mandatory
Quest Property MQ101 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0030_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0040_Item_00()
  CafeteriaPirates.enable(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Lab1Pirates.enable(False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Lab2Pirates.enable(False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  RoofPirates.enable(False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_LandingShip.TryToEnable()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.Stop()
EndFunction
