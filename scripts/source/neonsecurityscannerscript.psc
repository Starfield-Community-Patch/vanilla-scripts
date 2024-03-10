ScriptName NeonSecurityScannerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard scanGuard

;-- Properties --------------------------------------
wwiseevent Property AMB_Ext_CityNeon_AuroraScanner_Confirmation Auto Const mandatory
{ sound to play if no aurora detected }
wwiseevent Property AMB_Ext_CityNeon_AuroraScanner_Denial Auto Const mandatory
{ sound to play if aurora detected and guards alarmed }
Faction Property CurrentFollowerFaction Auto Const mandatory
Keyword Property GuardKeyword Auto Const mandatory
{ used to find nearby guards }
Potion Property Drug_Aurora Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Message Property Neon_AuroraSnifferMessage Auto Const mandatory
Float Property maxGuardDistance = 25.0 Auto Const
{ range to search for guards }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(Drug_Aurora as Form)
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef is Actor
    Self.ScanActor(akActionRef as Actor, True)
  ElseIf akActionRef.GetBaseObject() == Drug_Aurora as Form
    akActionRef.SetFactionOwner(CrimeFactionNeon, False)
    akActionRef.SendStealAlarm(Game.GetPlayer())
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  Guard scanGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.UnregisterForRemoteEvent(akActionRef as ScriptObject, "OnItemAdded")
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Function ScanActor(Actor ScanActor, Bool playSound)
  Guard scanGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If (ScanActor as Bool && Self.IsValidActor(ScanActor)) && Self.IsInTrigger(ScanActor as ObjectReference)
      Int auroraCount = ScanActor.GetItemCount(Drug_Aurora as Form)
      If auroraCount > 0
        AMB_Ext_CityNeon_AuroraScanner_Denial.PlayandWait(Self as ObjectReference, None, None)
        ObjectReference[] guards = Self.FindAllReferencesWithKeyword(GuardKeyword as Form, maxGuardDistance)
        If guards.Length > 0
          Int I = 0
          Actor guardActor = None
          Float currentDistance = maxGuardDistance + 1.0
          While I < guards.Length
            Actor testGuard = guards[I] as Actor
            Float testDistance = Self.GetDistance(testGuard as ObjectReference)
            If (testGuard as Bool && testGuard.IsDead() == False) && testDistance < currentDistance
              guardActor = testGuard
              currentDistance = testDistance
            EndIf
            I += 1
          EndWhile
          If guardActor
            guardActor.SendSmugglingAlarm(ScanActor)
            If Game.GetPlayer().IsInCombat() == False
              Neon_AuroraSnifferMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            EndIf
          EndIf
        EndIf
      Else
        Self.RegisterForRemoteEvent(ScanActor as ScriptObject, "OnItemAdded")
        AMB_Ext_CityNeon_AuroraScanner_Confirmation.PlayandWait(Self as ObjectReference, None, None)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == Drug_Aurora as Form
    Self.ScanActor(akSource as Actor, False)
  EndIf
EndEvent

Bool Function IsValidActor(Actor ScanActor)
  Return ScanActor.IsInFaction(CurrentFollowerFaction) || ScanActor == Game.GetPlayer()
EndFunction
