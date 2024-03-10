ScriptName SEDebugScript Extends Quest
{ Quest script for SEDebug, the Space Encounter Debug quest. }

;-- Structs -----------------------------------------
Struct SEDebugLocationDatum
  String DebugName
  Location DebugLocation
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  GlobalVariable Property SEChanceGlobal Auto Const mandatory
  GlobalVariable Property Se_ChanceRareGlobal Auto Const mandatory
  GlobalVariable Property Se_ChanceUniqueGlobal Auto Const mandatory
  GlobalVariable Property SE_Player_ChanceCommonGlobal Auto Const mandatory
  GlobalVariable Property SE_Player_ChanceRareGlobal Auto Const mandatory
  GlobalVariable Property SE_Player_ChanceUniqueGlobal Auto Const mandatory
  GlobalVariable Property SEDebugGlobal Auto Const mandatory
  GlobalVariable Property SE_SystemCountChance Auto Const mandatory
  GlobalVariable Property SE_Chance_CivilizedInUncivilizedSpace Auto Const mandatory
  GlobalVariable Property SE_Chance_UncivilizedInCivilizedSpace Auto Const mandatory
EndGroup

sedebugscript:sedebuglocationdatum[] Property SEDebugData Auto Const mandatory

;-- Functions ---------------------------------------

Function TestSE(String questName, String locationName)
  SEChanceGlobal.SetValue(100.0)
  Se_ChanceRareGlobal.SetValue(100.0)
  Se_ChanceUniqueGlobal.SetValue(100.0)
  SE_Player_ChanceCommonGlobal.SetValue(100.0)
  SE_Player_ChanceRareGlobal.SetValue(100.0)
  SE_Player_ChanceUniqueGlobal.SetValue(100.0)
  SE_SystemCountChance.SetValue(0.0)
  If locationName == "" || locationName == "0"
    spaceshipreference currentShip = PlayerShip.GetShipRef()
    Int I = 0
    While I < SEDebugData.Length
      If currentShip.GetCurrentLocation() != SEDebugData[I].DebugLocation
        Return 
      EndIf
      I += 1
    EndWhile
  EndIf
  Self.Reset()
EndFunction

Function TestFAB09(String locationName)
  SEChanceGlobal.SetValue(0.0)
  Se_ChanceRareGlobal.SetValue(100.0)
  Se_ChanceUniqueGlobal.SetValue(0.0)
  SE_Player_ChanceCommonGlobal.SetValue(0.0)
  SE_Player_ChanceRareGlobal.SetValue(0.0)
  SE_Player_ChanceUniqueGlobal.SetValue(0.0)
  If locationName == "" || locationName == "0"
    spaceshipreference currentShip = PlayerShip.GetShipRef()
    Int I = 0
    While I < SEDebugData.Length
      If currentShip.GetCurrentLocation() != SEDebugData[I].DebugLocation
        Return 
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction
