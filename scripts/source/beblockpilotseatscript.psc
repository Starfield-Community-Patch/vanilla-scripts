ScriptName BEBlockPilotSeatScript Extends ReferenceAlias
{ Script placed on a ship's pilot seat. Blocks players from sitting in the seat and taking over the ship, optionally until all enemy crew are dead. }

;-- Variables ---------------------------------------
Bool activationUnblocked

;-- Properties --------------------------------------
Message Property PilotSeatNotAuthorizedMessage Auto Const mandatory
{ Message to display when the player tries to sit in the ship's pilot seat while the block is in place. }
Bool Property ShouldAllowTakeoverWhenAllCrewDead = False Auto Const
{ Default=False; BEScript Quests ONLY. Should we allow the player to sit in the pilot seat and take over the ship once all enemy crew are dead? }

;-- Functions ---------------------------------------

Event OnAliasInit()
  ObjectReference myRef = Self.GetRef()
  myRef.BlockActivation(True, False)
  If ShouldAllowTakeoverWhenAllCrewDead
    bescript owningBEQuest = Self.GetOwningQuest() as bescript
    If owningBEQuest != None
      Self.RegisterForCustomEvent((Self.GetOwningQuest() as bescript) as ScriptObject, "bescript_BEAllCrewDead")
    EndIf
  EndIf
EndEvent

Event OnActivate(ObjectReference akActivator)
  If activationUnblocked == False && (akActivator == Game.GetPlayer() as ObjectReference)
    If Self.GetRef() is pilotseatfurniturescript == False
      PilotSeatNotAuthorizedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
EndEvent

Event BEScript.BEAllCrewDead(bescript source, Var[] akArgs)
  ObjectReference myRef = Self.GetRef()
  myRef.BlockActivation(False, False)
  activationUnblocked = True
EndEvent
