ScriptName RL083_AssemblyLine Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PanelTop01 Auto Const
ObjectReference Property PanelTop02 Auto Const
ObjectReference Property PanelSideL01 Auto Const
ObjectReference Property PanelSideL02 Auto Const
ObjectReference Property PanelSideL03 Auto Const
ObjectReference Property PanelSideL04 Auto Const
ObjectReference Property PanelSideL05 Auto Const
ObjectReference Property PanelSideR01 Auto Const
ObjectReference Property PanelSideR02 Auto Const
ObjectReference Property PanelSideR03 Auto Const
ObjectReference Property PanelSideR04 Auto Const
ObjectReference Property PanelSideR05 Auto Const
ObjectReference Property PanelFront Auto Const
ObjectReference Property WelderBot01 Auto Const
ObjectReference Property WelderBot02 Auto Const
ObjectReference Property WelderBot03 Auto Const
ObjectReference Property WelderBot04 Auto Const
ObjectReference Property HatchDoor Auto Const

;-- Functions ---------------------------------------

Function StartConstruct()
  WelderBot01.PlayAnimation("Play01")
  WelderBot02.PlayAnimation("Play01")
  WelderBot03.PlayAnimation("Play01")
  WelderBot04.PlayAnimation("Play01")
  Utility.Wait(2.0)
  PanelTop01.PlayAnimation("Play01")
  Utility.Wait(1.0)
  PanelTop02.PlayAnimation("Play01")
  Utility.Wait(1.0)
  PanelSideL01.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideL02.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideL03.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideL04.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideL05.PlayAnimation("Play01")
  Utility.Wait(1.0)
  PanelSideR01.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideR02.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideR03.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideR04.PlayAnimation("Play01")
  Utility.Wait(0.25)
  PanelSideR05.PlayAnimation("Play01")
  Utility.Wait(1.0)
  PanelFront.PlayAnimation("Play01")
  Utility.Wait(13.0)
  WelderBot01.PlayAnimation("Play02")
  WelderBot02.PlayAnimation("Play02")
  WelderBot03.PlayAnimation("Play02")
  WelderBot04.PlayAnimation("Play02")
  HatchDoor.SetOpen(True)
EndFunction
