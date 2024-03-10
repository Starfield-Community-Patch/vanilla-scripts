ScriptName Fragments:Quests:QF_SQ_GuardShips_Toliman_001C54EB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
GlobalVariable Property pUC08_TolimanGuardShipsSceneOnce Auto Const mandatory
Quest Property UC08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  If pUC08_TolimanGuardShipsSceneOnce.GetValue() < 1.0
    pUC08_TolimanGuardShipsSceneOnce.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  If pUC08_TolimanGuardShipsSceneOnce.GetValue() < 1.0
    pUC08_TolimanGuardShipsSceneOnce.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  UC08.SetStage(155)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
