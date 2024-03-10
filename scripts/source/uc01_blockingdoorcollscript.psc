ScriptName UC01_BlockingDoorCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property OpenOrClose Auto Const
{ If "TRUE", this is an Opening trigger, and walking into it will tell the Blocking Door to open when any trigger in this collection is entered.
Otherwise, it's a Blocking trigger and will close the blocking door when any trigger is entered }
ReferenceAlias Property BlockingDoor Auto Const mandatory
{ Ref Alias to the door blocking the button }
Int Property ShutdownStage Auto Const mandatory
{ Once this stage is set, we don't care anymore }
Scene Property UC01_320a_ContactDetected Auto Const mandatory
{ Scene to play if the player has contacted the wires in Sector A }
Scene Property UC01_320b_SectorAReset Auto Const mandatory
{ Scene to play once the player has reset Sector A }
Int Property FirstTimeStage Auto Const
{ Stage to set the first time the player enters one of these triggers }
LocationRefType Property UC01_SectorAResetTrigger_RefType Auto Const mandatory
{ Loc type to check for to throw the "First Time" stage }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest()
  If !OQ.GetStageDone(FirstTimeStage) && akSenderRef.HasRefType(UC01_SectorAResetTrigger_RefType)
    OQ.SetStage(FirstTimeStage)
  EndIf
  If !OQ.GetStageDone(ShutdownStage) && (akActionRef == Game.GetPlayer() as ObjectReference)
    ObjectReference myDoor = BlockingDoor.GetRef()
    If OpenOrClose
      If myDoor.GetOpenState() > 2
        If UC01_320a_ContactDetected.IsPlaying()
          UC01_320a_ContactDetected.Stop()
        EndIf
        UC01_320b_SectorAReset.Start()
        myDoor.SetOpen(True)
      EndIf
    ElseIf myDoor.GetOpenState() <= 2
      UC01_320a_ContactDetected.Start()
      myDoor.SetOpen(False)
    EndIf
  EndIf
EndEvent
