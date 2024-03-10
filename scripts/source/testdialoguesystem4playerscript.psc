ScriptName TestDialogueSystem4PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property IntTestVar = 1 Auto

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If IntTestVar == 1
    
  EndIf
  (Self.GetOwningQuest() as testdialoguesystem4script).TestMyFunction()
EndEvent
