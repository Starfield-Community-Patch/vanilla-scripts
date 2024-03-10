ScriptName Fragments:Quests:QF_MQ00_00005790 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  MQ101Debug.SetValueInt(10)
  Utility.Wait(0.100000001)
  MQ101.Start()
EndFunction
