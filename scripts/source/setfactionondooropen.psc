ScriptName SetFactionOnDoorOpen Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionToSet Auto Const
Keyword Property TargetActorKeyword Auto Const

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  Actor targetActor = Self.GetLinkedRef(TargetActorKeyword) as Actor
  If targetActor != None
    targetActor.AddToFaction(FactionToSet)
  EndIf
EndEvent
