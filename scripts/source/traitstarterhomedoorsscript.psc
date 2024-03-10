ScriptName TraitStarterHomeDoorsScript Extends RefCollectionAlias
{ handle player access to the Starter Home }

;-- Variables ---------------------------------------
Bool bDoorOpen = True
Float fPaymentTimestamp = -7.0

;-- Properties --------------------------------------
Message Property TraitStarterHome_DoorMortgageMessage Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Int Property MortgageObjectiveStage = 200 Auto Const
Int Property PaidOffMortgageStage = 400 Auto Const
Int Property EndQuestStage = 9000 Auto Const
Int Property ForeclosedStage = 500 Auto Const
Int Property MortgageDueDays = 7 Auto Const
{ how often (in days) is the mortgage due? }
GlobalVariable Property Trait_StarterHome_Interest Auto Const
{ how much does the mortage cost }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSource, ObjectReference akActionRef)
  If !bDoorOpen
    Int messageIndex = TraitStarterHome_DoorMortgageMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If messageIndex > -1
      If messageIndex == 0
        Game.GetPlayer().RemoveItem(Credits as Form, Trait_StarterHome_Interest.GetValueInt(), False, None)
        fPaymentTimestamp = Utility.GetCurrentGameTime() + MortgageDueDays as Float
        bDoorOpen = True
        Self.Lock(False, False, True)
        Self.BlockActivation(False, False)
      ElseIf messageIndex == 1
        Self.GetOwningQuest().SetStage(MortgageObjectiveStage)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnLoad(ObjectReference akSource)
  If akSource == Self.GetAt(0)
    If Self.GetOwningQuest().GetStageDone(ForeclosedStage)
      Self.Lock(True, False, True)
      Self.BlockActivation(False, False)
    ElseIf !Self.GetOwningQuest().GetStageDone(PaidOffMortgageStage)
      Float currentGameTime = Utility.GetCurrentGameTime()
      If currentGameTime >= fPaymentTimestamp
        bDoorOpen = False
        Self.Lock(True, False, True)
        Self.BlockActivation(True, False)
      EndIf
    Else
      bDoorOpen = True
      Self.Lock(False, False, True)
      Self.BlockActivation(False, False)
      Self.GetOwningQuest().SetStage(EndQuestStage)
    EndIf
  EndIf
EndEvent
