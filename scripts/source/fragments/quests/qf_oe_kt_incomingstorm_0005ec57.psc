ScriptName Fragments:Quests:QF_OE_KT_IncomingStorm_0005EC57 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_IncomingStorm_Scene00 Auto Const mandatory
Weather Property StormWeather Auto Const mandatory
Weather Property Sandstorm Auto Const mandatory
Weather Property Snowstorm Auto Const mandatory
Scene Property OE_KT_IncomingStorm_Start Auto Const mandatory
ReferenceAlias Property Alias_Generator Auto Const mandatory
Explosion Property ElectricalExplosionSmall Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const mandatory
wwiseevent Property Wwise_SuccessSound Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenA_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenB_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenC_Global Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
Scene Property OE_KT_IncomingStorm_ExplosionStart Auto Const mandatory
LeveledItem Property LL_OE_Default_Reward Auto Const mandatory
movablestatic Property BlowingFX_SmokeBillowing_lg Auto Const mandatory
Float Property Timer Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormTotalMoves_Global Auto Const mandatory
ReferenceAlias Property Alias_Terminal01 Auto Const mandatory
Scene Property OE_KT_IncomingStorm_Geologist_Greet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormTotalMoves_Global.SetValue(3.0)
  OE_KT_IncomingStormGenA_Global.SetValue(80.0)
  OE_KT_IncomingStormGenB_Global.SetValue(50.0)
  OE_KT_IncomingStormGenC_Global.SetValue(50.0)
  kmyQuest.PuzzleStart()
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormTotalMoves_Global.SetValue(3.0)
  OE_KT_IncomingStormGenA_Global.SetValue(30.0)
  OE_KT_IncomingStormGenB_Global.SetValue(100.0)
  OE_KT_IncomingStormGenC_Global.SetValue(50.0)
  kmyQuest.PuzzleStart()
EndFunction

Function Fragment_Stage_0003_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormTotalMoves_Global.SetValue(3.0)
  OE_KT_IncomingStormGenA_Global.SetValue(100.0)
  OE_KT_IncomingStormGenB_Global.SetValue(50.0)
  OE_KT_IncomingStormGenC_Global.SetValue(30.0)
  kmyQuest.PuzzleStart()
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormTotalMoves_Global.SetValue(4.0)
  OE_KT_IncomingStormGenA_Global.SetValue(50.0)
  OE_KT_IncomingStormGenB_Global.SetValue(90.0)
  OE_KT_IncomingStormGenC_Global.SetValue(40.0)
  kmyQuest.PuzzleStart()
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveFailed(10, True)
  Self.SetObjectiveFailed(20, True)
  Self.SetObjectiveFailed(30, True)
  Self.SetObjectiveFailed(100, True)
EndFunction

Function Fragment_Stage_0010_Item_00()
  OE_KT_IncomingStorm_Scene00.Start()
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormGenA_Global.Mod(-30.0)
  OE_KT_IncomingStormGenB_Global.Mod(30.0)
  kmyQuest.CheckPuzzle()
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormGenA_Global.Mod(-10.0)
  OE_KT_IncomingStormGenC_Global.Mod(10.0)
  kmyQuest.CheckPuzzle()
EndFunction

Function Fragment_Stage_0013_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormGenB_Global.Mod(-20.0)
  OE_KT_IncomingStormGenA_Global.Mod(20.0)
  kmyQuest.CheckPuzzle()
EndFunction

Function Fragment_Stage_0014_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormGenB_Global.Mod(-20.0)
  OE_KT_IncomingStormGenC_Global.Mod(20.0)
  kmyQuest.CheckPuzzle()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript
  OE_KT_IncomingStormGenA_Global.Mod(10.0)
  OE_KT_IncomingStormGenC_Global.Mod(-10.0)
  kmyQuest.CheckPuzzle()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  StormWeather.SetActive(False, False)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Sandstorm.SetActive(False, False)
EndFunction

Function Fragment_Stage_0100_Item_02()
  Snowstorm.SetActive(False, False)
EndFunction

Function Fragment_Stage_0100_Item_03()
  Alias_Terminal.GetRef().EnableNoWait(False)
  Alias_Terminal01.GetRef().EnableNoWait(False)
  OE_KT_IncomingStorm_Start.Start()
  Int random = Utility.RandomInt(0, 100)
  If random > 75
    Self.SetStage(1)
  ElseIf random > 50
    Self.SetStage(2)
  ElseIf random > 25
    Self.SetStage(3)
  Else
    Self.SetStage(4)
  EndIf
EndFunction

Function Fragment_Stage_0175_Item_00()
  Int instance1 = Wwise_Event_OBJ_Alarm_Generic_Play.Play(Alias_Terminal.GetRef(), None, None)
  Utility.Wait(Timer)
  wwiseevent.StopInstance(instance1)
  Self.SetStage(180)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_NPC03.GetRef().PlaceAtMe(ElectricalExplosionSmall as Form, 1, False, False, True, None, None, True)
  Utility.Wait(0.5)
  Alias_NPC03.GetActorRef().Kill(None)
  Self.SetObjectiveFailed(30, True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Wwise_SuccessSound.Play(Game.GetPlayer() as ObjectReference, None, None)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  OE_KT_IncomingStorm_Scene00.Stop()
  OE_KT_IncomingStorm_ExplosionStart.Start()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Weather.ReleaseOverride()
  Self.Stop()
EndFunction
