ScriptName TestDynamicTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------
Int maxEntriesCurrent01 = 6
Int maxEntriesCurrent02 = 6
Int maxEntriesInit = 6
Int maxIndex = 4
Int minEntries = 2
Int minIndex = 1
ObjectReference myTerminalRef
Int startingItemID = 0

;-- Properties --------------------------------------
TerminalMenu Property TestDynamicTerminalMenu Auto Const
TerminalMenu Property TestDynamicTerminalMenu02 Auto Const
TerminalMenu Property TestKurtDynamicTerminalItem Auto Const
TerminalMenu Property TestKurtDynamicTerminalItem02 Auto Const
TerminalMenu Property TestDeskop Auto Const
GlobalVariable[] Property TextReplacementGlobals Auto Const
Form Property TextReplacementForm Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  akTerminalRef.AddTextReplacementData("MiscItem01", TextReplacementForm)
  Int itemValue = TextReplacementForm.GetGoldValue()
  akTerminalRef.AddTextReplacementValue("MiscItem01Value", itemValue as Float)
EndEvent

Function InitEntries(TerminalMenu terminalToInit, Bool decrementEntries)
  terminalToInit.ClearDynamicMenuItems(myTerminalRef)
  Int maxEntriesCurrent = maxEntriesInit
  If decrementEntries
    If TestDynamicTerminalMenu
      maxEntriesCurrent01 += -1
      maxEntriesCurrent = maxEntriesCurrent01
    Else
      maxEntriesCurrent02 += -1
      maxEntriesCurrent = maxEntriesCurrent02
    EndIf
  Else
    maxEntriesCurrent = Utility.RandomInt(minEntries, maxEntriesInit)
    If TestDynamicTerminalMenu
      maxEntriesCurrent01 = maxEntriesCurrent
    Else
      maxEntriesCurrent02 = maxEntriesCurrent
    EndIf
  EndIf
  maxEntriesCurrent = Math.Max(minEntries as Float, maxEntriesCurrent as Float) as Int
  Int I = 0
  While I < maxEntriesCurrent
    Int index = Utility.RandomInt(minIndex, maxIndex)
    Int itemID = I + startingItemID
    TextReplacementGlobals[0].SetValue(itemID as Float)
    terminalToInit.AddDynamicMenuItem(myTerminalRef, index, itemID, TextReplacementGlobals as Form[])
    I += 1
  EndWhile
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  myTerminalRef = akTerminalRef
  akTerminalRef.AddTextReplacementData("TerminalMenu", TestDynamicTerminalMenu02 as Form)
  If akTerminalBase == TestDeskop && auiMenuItemID == 0
    Self.InitEntries(TestDynamicTerminalMenu, False)
  ElseIf akTerminalBase == TestDeskop && auiMenuItemID == 3
    Self.InitEntries(TestDynamicTerminalMenu02, False)
  ElseIf akTerminalBase == TestKurtDynamicTerminalItem && auiMenuItemID == 1
    Self.InitEntries(TestDynamicTerminalMenu, True)
  ElseIf akTerminalBase == TestKurtDynamicTerminalItem02 && auiMenuItemID == 1
    Self.InitEntries(TestDynamicTerminalMenu02, True)
  EndIf
EndEvent
