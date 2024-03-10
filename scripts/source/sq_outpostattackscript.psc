ScriptName SQ_OutpostAttackScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
reparentscript Property RE_Parent Auto Const mandatory
ReferenceAlias Property OutpostBeacon Auto Const mandatory
{ outpost beacon that we're attacking }
ReferenceAlias Property AttackTarget Auto Const mandatory
{ created marker in case outpost is removed while quest is running }
ReferenceAlias Property Trigger Auto Const mandatory
{ trigger in landing location - may not always exist if location isn't an OE location }
RefCollectionAlias Property Attackers Auto Const mandatory
{ attackers will spawn into this collection }
Keyword Property LocTypeMajorOrbital Auto Const mandatory
ActorValue Property OutpostLastAttackTimestamp Auto Const mandatory
{ used to timestamp last outpost attack }
Bool Property IsAttackStarted = False Auto hidden
Bool Property CountsAsAttack = True Auto Const
{ if true, this is counted as an outpost attack - planet is stamped when this starts so another attack isn't triggered during the cooldown 
    if false, don't treat this as a normal attack (no timestamp) }

;-- Functions ---------------------------------------

Function HandleAttackerLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  ; Empty function
EndFunction

Function HandleAttackersSpawning()
  ; Empty function
EndFunction

Function HandleQuestShutdown()
  ; Empty function
EndFunction

Function HandleQuestStarted()
  ; Empty function
EndFunction

Function HandleStartAttack()
  ; Empty function
EndFunction

Event OnQuestInit()
  Self.DisableTrigger(True)
  defaultgroupspawnquestscript myDefaultGroupQuest = (Self as Quest) as defaultgroupspawnquestscript
  If myDefaultGroupQuest
    Self.RegisterForCustomEvent(myDefaultGroupQuest as ScriptObject, "defaultgroupspawnquestscript_SpawnEvent")
  EndIf
  Self.RegisterForRemoteEvent(Attackers as ScriptObject, "OnLocationChange")
EndEvent

Event OnQuestStarted()
  Self.HandleQuestStarted()
  Self.RegisterForCustomEvent(RE_Parent as ScriptObject, "reparentscript_RECheckForCleanup")
  Self.TimestampAttack()
EndEvent

Event OnQuestShutdown()
  Self.DisableTrigger(False)
  Self.HandleQuestShutdown()
EndEvent

Function TimestampAttack()
  If CountsAsAttack
    ObjectReference outpostRef = OutpostBeacon.GetRef()
    If outpostRef
      Location outpostLocation = outpostRef.GetCurrentLocation()
      Location[] parentLocations = outpostLocation.GetParentLocations(LocTypeMajorOrbital)
      If parentLocations
        Location myPlanet = parentLocations[0]
        myPlanet.SetValue(OutpostLastAttackTimestamp, Utility.GetCurrentGameTime())
      EndIf
    EndIf
  EndIf
EndFunction

Function StartAttack(Bool bSetAttackTimestamp)
  IsAttackStarted = True
  If bSetAttackTimestamp
    Self.TimestampAttack()
  EndIf
  Self.HandleStartAttack()
EndFunction

Function DisableTrigger(Bool bDisable)
  ObjectReference triggerRef = Trigger.GetRef()
  If triggerRef
    If bDisable
      triggerRef.DisableNoWait(False)
    Else
      triggerRef.EnableNoWait(False)
    EndIf
  EndIf
EndFunction

Event DefaultGroupSpawnQuestScript.SpawnEvent(defaultgroupspawnquestscript akSender, Var[] akArgs)
  Self.HandleAttackersSpawning()
EndEvent

Event REParentScript.RECheckForCleanup(reparentscript akSender, Var[] akArgs)
  Self.CheckForCleanup()
EndEvent

Event RefCollectionAlias.OnLocationChange(RefCollectionAlias akSource, ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  Self.HandleAttackerLocationChange(akSenderRef, akOldLoc, akNewLoc)
EndEvent

Function CheckForCleanup()
  Bool shouldShutDown = False
  ObjectReference attackTargetRef = AttackTarget.GetRef()
  If Attackers.GetCountDead() == Attackers.GetCount()
    shouldShutDown = True
  ElseIf attackTargetRef as Bool && attackTargetRef.GetCurrentPlanet() != Game.GetPlayer().GetCurrentPlanet()
    shouldShutDown = True
  EndIf
  If shouldShutDown
    Self.Stop()
  EndIf
EndFunction
