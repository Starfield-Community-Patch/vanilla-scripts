ScriptName TESTMoveNPCOnUnload Extends ReferenceAlias
{ Test script to jump an NPC between various interior/exterior locations that aren't finished yet }

;-- Structs -----------------------------------------
Struct MoveData
  Int StageToCheck
  ObjectReference TeleportMarker
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
testmovenpconunload:movedata[] Property MoveDataArray Auto
{ Array for the set stages and the locations to jump the NPC to }

;-- Functions ---------------------------------------

Event OnUnload()
  Int I = 0
  Int iLength = MoveDataArray.Length
  Quest myInst = Self.GetOwningQuest()
  While I < iLength
    testmovenpconunload:movedata currData = MoveDataArray[I]
    Int currStage = currData.StageToCheck
    If myInst.GetStageDone(currStage)
      Self.GetRef().MoveTo(currData.TeleportMarker, 0.0, 0.0, 0.0, True, False)
      MoveDataArray.remove(I, 1)
      Return 
    EndIf
    I += 1
  EndWhile
EndEvent
