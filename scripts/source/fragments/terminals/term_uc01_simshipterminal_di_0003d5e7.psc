ScriptName Fragments:Terminals:TERM_UC01_SimShipTerminal_Di_0003D5E7 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01_ShipSimulatorHelperQuest Auto Const mandatory
spaceshipbase Property UC01_LvlShip_UC_A_Fighter_PossibleAlly01 Auto Const
GlobalVariable Property UC01_ShipSim_AllySpawned_Basic Auto Const mandatory
GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Auto Const mandatory
Perk Property UC01_DebugBuff_Weapons Auto Const mandatory
Perk Property UC01_DebugBuff_Shields Auto Const mandatory
GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Auto Const mandatory
Scene Property UC01_ShipSimQuest_400b_ShieldsIncreased Auto Const mandatory
Scene Property UC01_ShipSimQuest_400c_ShipDamageIncreased Auto Const mandatory
Scene Property UC01_ShipSimQuest_400d_Ally Auto Const mandatory
Quest Property UC01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(1.0)
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).ApplyShipPerk(UC01_DebugBuff_Shields)
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene()
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
    UC01.SetStage(420)
  EndIf
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(1.0)
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).ApplyShipPerk(UC01_DebugBuff_Weapons)
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene()
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
    UC01.SetStage(420)
  EndIf
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  UC01_ShipSim_AllySpawned_Basic.SetValue(1.0)
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).SpawnPlayerAlly(UC01_LvlShip_UC_A_Fighter_PossibleAlly01 as Form)
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene()
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
    UC01.SetStage(420)
  EndIf
EndFunction
