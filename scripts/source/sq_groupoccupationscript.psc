ScriptName SQ_GroupOccupationScript Extends Activator

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  GlobalVariable Property OccupationID Auto Const mandatory
  { the ID associated with this occupation (ex: "Scientist" or "Miner"). Will be saved in Dialogue AVs and used in conditions on the right side of conditions.
	NOTE: other Groups will have the same occupation. This defines THIS group's version of that occupation.
	Filter for: SQ_*Occupation* }
  Faction Property OccupationFaction Auto Const mandatory
  { A faction all the actors of this occupation are in.. }
  Message Property LeaderName Auto Const
  { A message for text replacing the name of an actor of this occupation when identifying them as a leader of the group
	Filter for: SQ_Group_OccupationLeaderName_* }
  Message Property VendorName Auto Const
  { A message for text replacing the name of an actor of this occupation when identifying them as a Vendor of the group
	Filter for: SQ_Group_OccupationVendorName_* }
  Faction Property DefaultOccupationVendorFaction Auto Const
  { default Vendor Faction for vendors spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis) }
  LeveledItem Property DefaultVendorList Auto Const
  { default vendor leveled list, will populate the vendor container with this list. }
  ActorBase Property DefaultRobot Auto Const mandatory
  { default actorbase for robots spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis) }
  ActorBase Property DefaultChild_Female Auto Const
  { default actorbase for female children spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis) }
  ActorBase Property DefaultChild_Male Auto Const
  { default actorbase for female children spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis) }
  ActorBase Property DefaultOlder_Female Auto Const
  { default actorbase for Older Female spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis) }
  ActorBase Property DefaultOlder_Male Auto Const
  { default actorbase for Older Male spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis) }
EndGroup


;-- Functions ---------------------------------------

Bool Function ValidateActor(Actor ActorToValidate)
  Bool factionCheck = ActorToValidate.IsInFaction(OccupationFaction)
  Return factionCheck
EndFunction

Function SetOverrideNameLeader(Actor ActorToOverrideName)
  ActorToOverrideName.SetOverrideName(LeaderName)
EndFunction

Function SetOverrideNameVendor(Actor ActorToOverrideName)
  ActorToOverrideName.SetOverrideName(VendorName)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
