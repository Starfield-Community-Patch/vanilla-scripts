ScriptName UC_GG_Connect_ScannerRefColScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UC_GG_Connect_ActiveScanner_Unscanned_Keyword Auto Const mandatory
{ Check to see if this scanner is one of the ones that the courier failed to hit on his earlier trip }
Keyword Property UC_GG_Connect_ActiveScanner_Objective_Keyword Auto Const mandatory
{ Used to check if this scanner is still in the ref collection that grants the objectives }
Topic Property UC_GG_CheckIn_Scanned Auto Const mandatory
{ Topic to fire if this is one of the scanners the player or courier have not yet hit }
Topic Property UC_GG_CheckIn_Unscanned Auto Const mandatory
{ Topic to fire if this is one of the scanners the player or courier have hit already }
RefCollectionAlias Property UnvisitedScanPoints Auto Const mandatory
{ Ref collection containing the scan points that the courier never reached before their murder }
RefCollectionAlias Property ScanTargetsObjectives Auto Const mandatory
{ Ref collection containing the scan points that the courier never reached before their murder }
GlobalVariable Property UC_GG_Connect_StopsCompleted Auto Const mandatory
{ Global used to track how many triggers the player's entered }
Int Property ObjectiveIndex = 200 Auto Const
{ Objective index we're modifying as each one of these scanners is updated }
Int Property PrereqStage = 200 Auto Const
{ Only start allowing activation once this stage is set }
Int Property ShutdownStage = 350 Auto Const
{ Once this stage is set, we can stop checking (because the player's already found the right one) }

;-- Functions ---------------------------------------

Function BlockScannerState(Bool bEnable)
  Int I = 0
  Int iCount = Self.GetCount()
  ObjectReference currRef = None
  While I < iCount
    currRef = Self.GetAt(I)
    currRef.BlockActivation(bEnable, bEnable)
    I += 1
  EndWhile
EndFunction

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Quest OQ = Self.GetOwningQuest()
    If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
      If akSenderRef.HasKeyword(UC_GG_Connect_ActiveScanner_Objective_Keyword)
        Int iObjIndex = ScanTargetsObjectives.Find(akSenderRef)
        ObjectReference currObjScan = ScanTargetsObjectives.GetAt(iObjIndex)
        If currObjScan != None
          ScanTargetsObjectives.RemoveRef(currObjScan)
          OQ.ModObjectiveGlobal(1.0, UC_GG_Connect_StopsCompleted, ObjectiveIndex, -1.0, True, True, True, False)
        EndIf
      EndIf
    EndIf
    If akSenderRef.HasKeyword(UC_GG_Connect_ActiveScanner_Unscanned_Keyword)
      Int iScanIndex = UnvisitedScanPoints.Find(akSenderRef)
      ObjectReference currScan = UnvisitedScanPoints.GetAt(iScanIndex)
      If currScan != None
        UnvisitedScanPoints.RemoveRef(currScan)
      EndIf
      akSenderRef.Say(UC_GG_CheckIn_Unscanned, None, False, None)
    Else
      akSenderRef.Say(UC_GG_CheckIn_Scanned, None, False, None)
    EndIf
  EndIf
EndEvent
