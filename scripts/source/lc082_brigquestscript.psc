ScriptName LC082_BrigQuestScript Extends Quest conditional
{ Quest script for LC082. Manages the Brig on the UC Vigilance. }

;-- Structs -----------------------------------------
Struct BrigCellDatum
  Bool cellOccupied
  ObjectReference cellDoor
  ObjectReference cellMarker
  ObjectReference cellTrigger
  ObjectReference cellTalkZoneTrigger
  Actor cellPrisoner
EndStruct


;-- Variables ---------------------------------------
Int CONST_Assistance_HelpsAllies = 1 Const
Int CONST_InitializationDelayTimeout = 300 Const
Bool initialized

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard BrigDataGuard

;-- Properties --------------------------------------
Group QuestProperties
  lc082_brigquestscript:brigcelldatum[] Property BrigData Auto hidden
  { Struct array of data representing the Brig.
	 For convenience, to match the cell numbers on the terminal, BrigData[0] is unused/None. }
  Int Property CurrentPrisonerCount Auto conditional hidden
  { Number of prisoners currently in the Brig. }
EndGroup

Group AutofillProperties
  ReferenceAlias Property BrigManager Auto Const mandatory
  RefCollectionAlias Property BrigPrisoners Auto Const mandatory
  ActorBase Property LC082_LvlPrisonersGeneric Auto Const mandatory
  ActorValue Property Assistance Auto Const mandatory
  Armor Property Clothes_Prisoner_Scrubs_SysDef Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LC082_LinkBrigCellMarker Auto Const mandatory
  Keyword Property LC082_LinkBrigCellTrigger Auto Const mandatory
  Keyword Property LC082_LinkBrigCellTalkZoneTrigger Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function InitBrig()
  Self.Start()
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If !initialized
      ObjectReference[] brigCellDoors = BrigManager.GetRef().GetLinkedRefChain(LinkCustom01, 100)
      BrigData = new lc082_brigquestscript:brigcelldatum[brigCellDoors.Length + 1]
      Int I = 0
      While I < brigCellDoors.Length
        lc082_brigquestscript:brigcelldatum newDatum = new lc082_brigquestscript:brigcelldatum
        newDatum.cellDoor = brigCellDoors[I]
        newDatum.cellMarker = newDatum.cellDoor.GetLinkedRef(None)
        newDatum.cellTrigger = newDatum.cellMarker.GetLinkedRef(None)
        newDatum.cellTalkZoneTrigger = newDatum.cellTrigger.GetLinkedRef(None)
        BrigData[I + 1] = newDatum
        I += 1
      EndWhile
      initialized = True
    Else
      Int i = 0
      While i < BrigData.Length
        lc082_brigquestscript:brigcelldatum currentData = BrigData[i]
        If currentData != None
          Actor currentPrisoner = currentData.cellPrisoner
          If currentPrisoner != None
            currentPrisoner.SetLinkedRef(currentData.cellMarker, LC082_LinkBrigCellMarker, True)
            currentPrisoner.SetLinkedRef(currentData.cellTrigger, LC082_LinkBrigCellTrigger, True)
            currentPrisoner.SetLinkedRef(currentData.cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger, True)
            currentPrisoner.DisableNoWait(False)
            currentPrisoner.MoveTo(currentData.cellMarker, 0.0, 0.0, 0.0, True, False)
            currentPrisoner.Enable(False)
            currentPrisoner.RemoveAllItems(None, False, False)
            currentPrisoner.EquipItem(Clothes_Prisoner_Scrubs_SysDef as Form, False, False)
            currentPrisoner.EvaluatePackage(False)
            currentPrisoner.MoveTo(currentData.cellMarker, 0.0, 0.0, 0.0, True, False)
          EndIf
        EndIf
        i += 1
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Actor Function AddPrisoner(Actor newPrisoner, Int cellID)
  If !initialized
    Int I = 0
    While !initialized && I < CONST_InitializationDelayTimeout
      I += 1
      Utility.Wait(0.100000001)
    EndWhile
    If !initialized
      Return None
    EndIf
  EndIf
  Actor result = None
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If newPrisoner != None
      If newPrisoner.IsDead()
        Return None
      EndIf
      Int prisonerInCell = BrigData.findstruct("cellPrisoner", newPrisoner, 0)
      If prisonerInCell >= 0
        Return None
      EndIf
    EndIf
    If cellID <= 0 || cellID >= BrigData.Length || BrigData[cellID].cellPrisoner != None
      cellID = Self.Private_FindRandomUnoccupiedCellID()
    EndIf
    If newPrisoner == None
      newPrisoner = BrigData[cellID].cellMarker.PlaceActorAtMe(LC082_LvlPrisonersGeneric, 2, None, False, False, True, None, True)
    EndIf
    BrigData[cellID].cellOccupied = True
    BrigData[cellID].cellPrisoner = newPrisoner
    BrigPrisoners.AddRef(newPrisoner as ObjectReference)
    newPrisoner.SetLinkedRef(BrigData[cellID].cellMarker, LC082_LinkBrigCellMarker, True)
    newPrisoner.SetLinkedRef(BrigData[cellID].cellTrigger, LC082_LinkBrigCellTrigger, True)
    newPrisoner.SetLinkedRef(BrigData[cellID].cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger, True)
    newPrisoner.DisableNoWait(False)
    newPrisoner.MoveTo(BrigData[cellID].cellMarker, 0.0, 0.0, 0.0, True, False)
    newPrisoner.Enable(False)
    newPrisoner.RemoveAllItems(None, False, False)
    newPrisoner.EquipItem(Clothes_Prisoner_Scrubs_SysDef as Form, False, False)
    newPrisoner.EvaluatePackage(False)
    newPrisoner.MoveTo(BrigData[cellID].cellMarker, 0.0, 0.0, 0.0, True, False)
    CurrentPrisonerCount += 1
    result = newPrisoner
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Return result
EndFunction

Function DisablePrisoner(Actor prisonerRef)
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int cellID = BrigData.findstruct("cellPrisoner", prisonerRef, 0)
    If cellID >= 0
      prisonerRef.DisableNoWait(False)
      BrigData[cellID].cellOccupied = False
      BrigData[cellID].cellPrisoner = None
      CurrentPrisonerCount -= 1
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ResetAllPrisoners()
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int I = 0
    While I < BrigData.Length
      If BrigData[I].cellOccupied
        Actor current = BrigData[I].cellPrisoner
        current.Reset(None)
        current.SetLinkedRef(BrigData[I].cellMarker, LC082_LinkBrigCellMarker, True)
        current.SetLinkedRef(BrigData[I].cellTrigger, LC082_LinkBrigCellTrigger, True)
        current.SetLinkedRef(BrigData[I].cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger, True)
        current.DisableNoWait(False)
        current.MoveTo(BrigData[I].cellMarker, 0.0, 0.0, 0.0, True, False)
        current.Enable(False)
        current.RemoveAllItems(None, False, False)
        current.EquipItem(Clothes_Prisoner_Scrubs_SysDef as Form, False, False)
        current.EvaluatePackage(False)
        current.MoveTo(BrigData[I].cellMarker, 0.0, 0.0, 0.0, True, False)
      EndIf
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Actor Function ReleasePrisoner(Int cellID)
  If !initialized
    
  EndIf
  Actor releasedPrisoner = None
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If cellID <= 0 || cellID >= BrigData.Length
      
    Else
      BrigData[cellID].cellOccupied = False
      BrigData[cellID].cellDoor.Unlock(False)
      BrigData[cellID].cellDoor.SetOpen(True)
      releasedPrisoner = BrigData[cellID].cellPrisoner
      If releasedPrisoner != None
        BrigData[cellID].cellPrisoner = None
        BrigPrisoners.RemoveRef(releasedPrisoner as ObjectReference)
        CurrentPrisonerCount -= 1
        If releasedPrisoner.GetValue(Assistance) < CONST_Assistance_HelpsAllies as Float
          releasedPrisoner.SetValue(Assistance, CONST_Assistance_HelpsAllies as Float)
        EndIf
        releasedPrisoner.EvaluatePackage(False)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Return releasedPrisoner
EndFunction

Function EVPPrisoners()
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int I = 0
    While I < BrigData.Length
      lc082_brigquestscript:brigcelldatum currentData = BrigData[I]
      If currentData != None
        Actor currentPrisoner = currentData.cellPrisoner
        If currentPrisoner != None
          currentPrisoner.EvaluatePackage(False)
        EndIf
      EndIf
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Int Function GetBrigDataLength()
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Return BrigData.Length
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Int Function Private_FindRandomUnoccupiedCellID()
  Int randomCell = Utility.RandomInt(1, BrigData.Length)
  Int I = randomCell
  While I < BrigData.Length
    If BrigData[I] != None && !BrigData[I].cellOccupied
      Return I
    EndIf
    I += 1
  EndWhile
  I = 0
  While I < randomCell
    If BrigData[I] != None && !BrigData[I].cellOccupied
      Return I
    EndIf
    I += 1
  EndWhile
  Return -1
EndFunction
