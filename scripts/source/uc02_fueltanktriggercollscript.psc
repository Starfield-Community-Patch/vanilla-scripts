ScriptName UC02_FuelTankTriggerCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Bool bInCooldown
Int iCooldownTimerID = 1 Const

;-- Properties --------------------------------------
ReferenceAlias Property Terrormorph Auto Const mandatory
{ Ref alias for the Terrormorph }
GlobalVariable Property UC02_PlayerTankDetonationDistance Auto Const mandatory
{ How close the player needs to be to count as "triggering" the tank }
Scene Property UC02_602_DetonatingFuelTank Auto Const mandatory
{ Scene to play when detonating a fuel tank }
Float Property SceneCooldownTimerLength = 3.0 Auto Const
{ How long to wait between scene triggerings }
Int Property ShutdownStage = 700 Auto Const
{ If this stage is set, Terrormorph is dead, so we don't need to }
Int Property BlewAtLeastOneTankStage = 660 Auto Const
{ Stage to set if the player detonated at least one tank }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor TerrorACT = Terrormorph.GetActorRef()
  Quest myQuest = Self.GetOwningQuest()
  If (akActionRef == TerrorACT as ObjectReference) && !TerrorACT.IsDead() && !myQuest.GetStageDone(ShutdownStage)
    If Game.GetPlayer().GetDistance(akSenderRef) <= UC02_PlayerTankDetonationDistance.GetValue()
      ObjectReference LinkedTank = akSenderRef.GetLinkedRef(None)
      If LinkedTank
        Self.RemoveRef(akSenderRef)
        myQuest.SetStage(BlewAtLeastOneTankStage)
        If !bInCooldown
          bInCooldown = True
          UC02_602_DetonatingFuelTank.Start()
          Self.StartTimer(SceneCooldownTimerLength, iCooldownTimerID)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iCooldownTimerID
    bInCooldown = False
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
