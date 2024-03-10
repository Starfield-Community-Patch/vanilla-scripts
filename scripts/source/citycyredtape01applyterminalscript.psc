ScriptName CityCYRedTape01ApplyTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
TerminalMenu Property SY_Deimos_SalesSubTerminal_Assistant_Submit_Genesis Auto Const mandatory
Int Property PlayerNameBodyTextIndex = 0 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  akTerminalRef.AddTextReplacementData("PlayerLabel", Game.GetPlayer().GetBaseObject())
  terminalscript myTerminalRef = akTerminalRef as terminalscript
  Form[] textReplacementArray = new Form[0]
  textReplacementArray.add(Game.GetPlayer() as Form, 1)
  SY_Deimos_SalesSubTerminal_Assistant_Submit_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, PlayerNameBodyTextIndex, 1, textReplacementArray)
EndEvent
