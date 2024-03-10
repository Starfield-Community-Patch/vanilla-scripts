ScriptName DebugSoundScriptingQuest Extends Quest
{ http://intranet.bethsoft.com/genesis_editor/index.php/WwiseEvent_Script }

;-- Variables ---------------------------------------
String GlobalRTPCName = "Papyrus_Test_Global_RTPC"
String GlobalStateGroup = "Papyrus_Test_Global_State"
String GlobalStateName1 = "Papyrus_Global_State_01"
String GlobalStateName2 = "Papyrus_Global_State_02"
String InstanceRTPCName = "Papyrus_Test_Instance_RTPC"
String InstanceSwitchGroup = "Papyrus_Test_Switch_Instance"
String InstanceSwitchName1 = "Papyrus_3D_Loop"
String InstanceSwitchName2 = "Papyrus_2D_Loop"
Int eventInstance1 = 0
Int eventInstance2 = 0

;-- Properties --------------------------------------
wwiseevent Property EventForm1 Auto Const mandatory
{ 3D positional, loop.  Attenuation should start after a couple meters. }
wwiseevent Property EventForm2 Auto Const mandatory
{ 2D positionless, loop. }
wwiseevent Property EventForm3 Auto Const mandatory
{ 3D positional, not looping. }
ReferenceAlias Property ThreeDPost_Switch_On Auto Const mandatory
{ 3D event source }
Float Property GlobalRTPCValue1 Auto Const mandatory
{ Global RTPC Value1 }
Float Property GlobalRTPCValue2 Auto Const mandatory
{ Global RTPC Value2 }
Float Property InstanceRTPCValue1 Auto Const mandatory
{ Instance RTPC Value1 }
Float Property InstanceRTPCValue2 Auto Const mandatory
{ Instance RTPC Value2 }
Message Property TEST_SoundScriptingWarning Auto Const
{ Warning messagebox }

;-- Functions ---------------------------------------

Function TriggerButtonBehavior(Int iButtonIndex)
  If iButtonIndex == 1
    wwiseevent.StopInstance(eventInstance1)
    EventForm3.PlayAndWait(ThreeDPost_Switch_On.GetRef(), None, None)
    eventInstance1 = EventForm1.Play(ThreeDPost_Switch_On.GetRef(), None, None)
  ElseIf iButtonIndex == 2
    wwiseevent.StopInstance(eventInstance1)
  ElseIf iButtonIndex == 3
    wwiseevent.StopInstance(eventInstance2)
    eventInstance2 = EventForm2.PlayUI(None, None)
  ElseIf iButtonIndex == 4
    wwiseevent.StopInstance(eventInstance2)
  ElseIf iButtonIndex == 5
    wwiseevent.SetGlobalRTPC(GlobalRTPCName, GlobalRTPCValue1)
  ElseIf iButtonIndex == 6
    wwiseevent.SetGlobalRTPC(GlobalRTPCName, GlobalRTPCValue2)
  ElseIf iButtonIndex == 7
    wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateName1)
  ElseIf iButtonIndex == 8
    wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateName2)
  ElseIf iButtonIndex == 9
    wwiseevent.UpdateInstanceRTPC(eventInstance2, GlobalRTPCName, InstanceRTPCValue1)
  ElseIf iButtonIndex == 10
    wwiseevent.UpdateInstanceRTPC(eventInstance2, GlobalRTPCName, InstanceRTPCValue2)
  ElseIf iButtonIndex == 11
    wwiseevent.StopInstance(eventInstance2)
    wwiseevent:wwiseswitchparam[] switches = new wwiseevent:wwiseswitchparam[1]
    switches[0] = wwiseevent.MakeNewWwiseSwitchParam(InstanceSwitchGroup, InstanceSwitchName2)
    eventInstance2 = EventForm2.PlayUI(switches, None)
  ElseIf iButtonIndex == 12
    wwiseevent.StopInstance(eventInstance2)
    wwiseevent:wwiseswitchparam[] switches = new wwiseevent:wwiseswitchparam[1]
    switches[0] = wwiseevent.MakeNewWwiseSwitchParam(InstanceSwitchGroup, InstanceSwitchName1)
    eventInstance2 = EventForm2.PlayUI(switches, None)
  Else
    TEST_SoundScriptingWarning.Show(iButtonIndex as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction
