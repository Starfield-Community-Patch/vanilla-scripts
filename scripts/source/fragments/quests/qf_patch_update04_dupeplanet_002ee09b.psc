ScriptName Fragments:Quests:QF_Patch_Update04_DupePlanet_002EE09B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_gravitationaltraitsscript Property pSQ_GravitationalTraits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  If pSQ_GravitationalTraits.ArePlanetLocationsDuped()
    pSQ_GravitationalTraits.CheckAndRefillPlanetDupes()
  EndIf
  Self.Stop()
EndFunction
