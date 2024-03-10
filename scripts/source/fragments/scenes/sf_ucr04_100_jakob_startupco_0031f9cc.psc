ScriptName Fragments:Scenes:SF_UCR04_100_Jakob_StartUpCO_0031F9CC Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UCR04_ReminderCount Auto Const mandatory
GlobalVariable Property UCR04_TimesCompleted Auto Const mandatory
GlobalVariable Property UCR04_ReminderFrequency Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Int iRemainder = 0
  Int iTimesCompleted = UCR04_TimesCompleted.GetValueInt()
  Int iFrequency = UCR04_ReminderFrequency.GetValueInt()
  iRemainder = iTimesCompleted % iFrequency
  UCR04_ReminderCount.SetValue(iRemainder as Float)
EndFunction
