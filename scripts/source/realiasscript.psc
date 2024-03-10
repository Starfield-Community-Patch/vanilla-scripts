ScriptName REAliasScript Extends ReferenceAlias
{ Should be attached to all aliases in Random Encounter and Overlay Encounter Quests.
	NOTE: changes here should also be made to RECollectionAliasScript }

;-- Variables ---------------------------------------
String LocalScriptName = "REAliasScript" Const

;-- Properties --------------------------------------
Group Flags
  Bool Property StartsDead = False Auto Const
  { Default = FALSE; should the actor be killed when they spawn? To be replaced by code solution. }
  Bool Property RegisterAlias = True Auto Const
  { Default = TRUE; for now, all aliases should register - this property may end up being removed }
  Bool Property TrackDeath = False Auto Const
  { Default = FALSE; set to true if you want the quest to track when this alias dies and set a stage
		NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details }
  Int Property GroupIndex = 0 Auto Const
  { Default = 0; used for tracking death, if you have more than one group.
		This index needs to match how you've set up DeadCounts arrays in REScript }
  Int Property OnHitStage Auto Const
  { Stage to set if actor is hit. }
  Faction Property OnHitFaction Auto Const
  { Faction of attacking actor which triggers OnHitStage. 
		Default = trigger on hit from player }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  rescript owningREScript = Self.GetOwningQuest() as rescript
  If RegisterAlias && owningREScript as Bool
    owningREScript.RegisterAlias(Self as ReferenceAlias)
  EndIf
  Self.CustomRegisterForHit()
EndEvent

Event OnLoad()
  If StartsDead
    Actor a = Self.GetActorRef()
    If a as Bool && a.IsDead() == False
      a.MoveToMyEditorLocation()
      rescript owningREScript = Self.GetOwningQuest() as rescript
      If owningREScript
        owningREScript.RE_Parent.KillWithForce(a, None, True)
      Else
        a.KillSilent(None)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnDeath(ObjectReference akKiller)
  rescript owningREScript = Self.GetOwningQuest() as rescript
  If TrackDeath && owningREScript as Bool
    owningREScript.IncrementDeadCount(GroupIndex)
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
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
