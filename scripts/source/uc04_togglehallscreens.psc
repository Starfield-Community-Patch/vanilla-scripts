ScriptName UC04_ToggleHallScreens Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property MinisterHall_Screens Auto Const mandatory
{ Collection that contains all the screens in the Minister's Hall }

;-- Functions ---------------------------------------

Function UpdateHallScreens(Bool bTurnOn)
  Int I = 0
  Int iCount = MinisterHall_Screens.GetCount()
  While I < iCount
    ObjectReference currACT = MinisterHall_Screens.GetAt(I)
    If bTurnOn
      currACT.PlayAnimation("Stage01_Start")
    Else
      currACT.PlayAnimation("Stage01_Stop")
    EndIf
    I += 1
  EndWhile
EndFunction
