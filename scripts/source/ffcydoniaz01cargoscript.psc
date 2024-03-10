ScriptName FFCydoniaZ01CargoScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Cargo Auto Const mandatory
ReferenceAlias Property Cargo01 Auto Const mandatory
Int Property StageToSet Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_Leech01_MSG Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_Leech02_MSG Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_NoLeech01_MSG Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_NoLeech02_MSG Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckCount()
  If Cargo.GetCount() <= 0
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndFunction

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Int iRandom = Utility.RandomInt(1, 2)
  ObjectReference myLinkedRef = akSenderRef.GetLinkedRef(LinkCustom01)
  If myLinkedRef
    If iRandom == 1
      FFCydoniaZ01_Cargo_Leech01_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      FFCydoniaZ01_Cargo_Leech02_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
    myLinkedRef.Enable(True)
    (myLinkedRef as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False)
  ElseIf iRandom == 1
    FFCydoniaZ01_Cargo_NoLeech01_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    FFCydoniaZ01_Cargo_NoLeech02_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
  If akSenderRef == Cargo01.GetRef()
    Cargo01.Clear()
  EndIf
  Cargo.RemoveRef(akSenderRef)
  akSenderRef.BlockActivation(True, True)
  Self.CheckCount()
EndEvent
