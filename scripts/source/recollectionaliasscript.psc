ScriptName RECollectionAliasScript Extends RefCollectionAlias
{ Should be attached to all ref collection aliases in Random Encounter quests.
 NOTE: changes here should also be made to REAliasScript }

;-- Variables ---------------------------------------
String LocalScriptName = "RECollectionAliasScript" Const

;-- Properties --------------------------------------
Group Flags
  Bool Property StartsDead = False Auto Const
  { Default = FALSE; should the actor be killed when they spawn? To be replaced by code solution. }
  Bool Property RegisterAlias = True Auto Const
  { Default = TRUE; for now, all aliases should register - this property may end up being removed }
  Bool Property TrackDeath = False Auto Const
  { Default = FALSE; set to true if you want the quest to track when this alias dies and set a stage
	 NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details }
  Bool Property TrackOnDying = False Auto Const
  { Default = FALSE; set to true to fire when actors startdying instead of at the end of dying
	 NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details }
  Int Property RequiredStageToFireTrackDeath = -1 Auto Const
  { If -1 does nothing, otherwise only sends TrackDeath updates when the quest is set to this stage, 
	this is useful for using in conjunction witht he encounter wave setup that populates a RE RefCol }
  Bool Property ForceRefsToEnable = True Auto Const
  { When set to False, if the Reference Collection Alias is set to Initially Disabled then this script will not force them to become enabled. }
EndGroup

Group DeadCountGroups
  Int Property GroupIndex = 0 Auto Const
  { Default = 0; used for tracking death, if you have more than one group.
	This index needs to match how you've set up DeadCounts arrays in REScript }
  Bool Property AddCollectionSizeToGroupSize = False Auto Const
  { if TRUE, will automatically add the collection's size to the group count size }
EndGroup

Group OnHit
  Int Property OnHitStage Auto Const
  { stage to set if actor is hit }
  Faction Property OnHitFaction Auto Const
  { faction of attacking actor which triggers OnHitStage
	 Default = trigger on hit from player }
EndGroup

Group Randomize
  Int Property minimumCount = 0 Auto Const
  { if you want to randomize the number that actually appear, set a minimumCount less than the collection size
	  when the quest starts, the number that actually appear will be between minimumCount and the total collection size
	  (the others will be disabled and killed) }
  Bool Property RemoveUnusedRefs = False Auto Const
  { when set to True, any actors that are "unused" will also be removed from the ref collection 
	  this is mainly to allow BE quests to handle disembarking these actors correctly }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  rescript owningREScript = Self.GetOwningQuest() as rescript
  If RegisterAlias && owningREScript as Bool
    owningREScript.RegisterCollectionAlias(Self as RefCollectionAlias)
  EndIf
  Self.CustomRegisterForHit()
  Int maxCount = Self.GetCount()
  If AddCollectionSizeToGroupSize && GroupIndex > -1 && owningREScript as Bool
    owningREScript.AdjustDeadCounts(GroupIndex, maxCount)
  EndIf
  Int numberToEnable = maxCount
  If minimumCount > 0 && minimumCount < maxCount
    numberToEnable = Utility.RandomInt(minimumCount, maxCount)
  EndIf
  ObjectReference[] refsToEnable = new ObjectReference[0]
  Int I = maxCount - 1
  While I > -1
    ObjectReference theRef = Self.GetAt(I)
    If theRef
      If I < numberToEnable
        refsToEnable.add(theRef, 1)
      Else
        theRef.Disable(False)
        If theRef is Actor
          (theRef as Actor).Kill(None)
        ElseIf theRef is spaceshipreference
          (theRef as spaceshipreference).Kill(None)
        EndIf
        If RemoveUnusedRefs
          Self.RemoveRef(theRef)
        EndIf
      EndIf
    EndIf
    I += -1
  EndWhile
  If ForceRefsToEnable
    If refsToEnable.Length > 0
      Int enableIndex = 0
      While enableIndex < refsToEnable.Length
        refsToEnable[enableIndex].Enable(False)
        enableIndex += 1
      EndWhile
    EndIf
  EndIf
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  If StartsDead
    Actor a = akSenderRef as Actor
    If a as Bool && a.IsDead() == False
      a.MoveToMyEditorLocation()
      rescript owningREScript = Self.GetOwningQuest() as rescript
      If owningREScript
        owningREScript.RE_Parent.KillWithForce(a, None, True)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If TrackDeath
    rescript owningREScript = Self.GetOwningQuest() as rescript
    If owningREScript as Bool && (RequiredStageToFireTrackDeath == -1 || RequiredStageToFireTrackDeath == Self.GetOwningQuest().GetStage())
      owningREScript.IncrementDeadCount(GroupIndex)
    EndIf
  EndIf
EndEvent

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
  If TrackOnDying
    rescript owningREScript = Self.GetOwningQuest() as rescript
    If owningREScript as Bool && (RequiredStageToFireTrackDeath == -1 || RequiredStageToFireTrackDeath == Self.GetOwningQuest().GetStage())
      owningREScript.IncrementDeadCount(GroupIndex)
    EndIf
  EndIf
EndEvent

Event OnHit(ObjectReference akSenderRef, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If OnHitStage > 0 && (akAggressor as Actor) as Bool
    Actor attackingActor = akAggressor as Actor
    If (OnHitFaction as Bool && attackingActor.IsInFaction(OnHitFaction)) || OnHitFaction == None && attackingActor == Game.GetPlayer()
      Self.GetOwningQuest().SetStage(OnHitStage)
    EndIf
  EndIf
  Self.CustomRegisterForHit()
EndEvent

Function CustomRegisterForHit()
  If OnHitStage > 0 && Self.GetOwningQuest().GetStageDone(OnHitStage) == False
    If OnHitFaction
      Self.RegisterForHitEvent(Self as ScriptObject, OnHitFaction as ScriptObject, None, None, -1, -1, -1, -1, True)
    Else
      Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
    EndIf
  EndIf
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
  rescript owningREScript = Self.GetOwningQuest() as rescript
  If owningREScript
    owningREScript.Trace(CallingObject, asTextToPrint, aiSeverity)
    Debug.Trace((CallingObject as String + " ") + asTextToPrint, aiSeverity)
  Else
    Debug.Trace((CallingObject as String + " ") + asTextToPrint, aiSeverity)
  EndIf
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
  rescript owningREScript = Self.GetOwningQuest() as rescript
  If owningREScript
    owningREScript.warning(CallingObject, asTextToPrint, False, 2, False, True, True)
  EndIf
EndFunction
