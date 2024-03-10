ScriptName TestSESatRepairQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property DamagedSectionsAlias Auto

;-- Functions ---------------------------------------

Event OnQuestInit()
  Int count = 0
  While count < DamagedSectionsAlias.GetCount()
    ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count)
    Self.RegisterForHitEvent(currentObjectReference as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    Self.RegisterForRemoteEvent(currentObjectReference as ScriptObject, "OnActivate")
    count += 1
  EndWhile
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akSender.GetScale() > 2.0
    akSender.SetScale(akSender.GetScale() - 0.25)
    Self.RegisterForHitEvent(akSender as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Else
    akSender.DisableNoWait(False)
    Self.SetStage(100)
    Self.CheckForOneMoreRemaining()
    If Self.CheckForAllDisabled()
      Self.SetStage(500)
    EndIf
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akTarget.GetScale() > 2.0
    akTarget.SetScale(akTarget.GetScale() - 0.25)
    Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Else
    akTarget.DisableNoWait(False)
    Self.SetStage(100)
    Self.CheckForOneMoreRemaining()
    If Self.CheckForAllDisabled()
      Self.SetStage(500)
    EndIf
  EndIf
EndEvent

Bool Function CheckForOneMoreRemaining()
  Int count = 0
  Int countDisabled = 0
  Int countMax = DamagedSectionsAlias.GetCount()
  While count < countMax
    ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count)
    If currentObjectReference.IsDisabled()
      countDisabled += 1
    EndIf
    count += 1
  EndWhile
  If countDisabled == countMax - 1
    Self.SetStage(200)
  EndIf
EndFunction

Bool Function CheckForAllDisabled()
  Int count = 0
  While count < DamagedSectionsAlias.GetCount()
    ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count)
    If currentObjectReference.IsDisabled()
      
    Else
      Return False
    EndIf
    count += 1
  EndWhile
  Return True
EndFunction
