ScriptName LoadElevatorLoitererScript Extends ObjectReference

;-- Structs -----------------------------------------
Struct ActorEntryData
  Actor actorRef
  Float entryTime
EndStruct


;-- Variables ---------------------------------------
loadelevatorloitererscript:actorentrydata[] actorsInManagerRoom

;-- Properties --------------------------------------
GlobalVariable Property LoadElevatorLoiteringLimitSeconds Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  actorsInManagerRoom = new loadelevatorloitererscript:actorentrydata[0]
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef is Actor
    loadelevatorloitererscript:actorentrydata data = new loadelevatorloitererscript:actorentrydata
    data.actorRef = akActionRef as Actor
    data.entryTime = Utility.GetCurrentRealTime()
    actorsInManagerRoom.add(data, 1)
    Self.StartTimer(LoadElevatorLoiteringLimitSeconds.value, 0)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  ObjectReference loadEelevatorManagerRef = Self.GetLinkedRef(None)
  If loadEelevatorManagerRef != None && loadEelevatorManagerRef is loadelevatormanagerscript
    loadelevatormanagerscript loadElevatorManager = loadEelevatorManagerRef as loadelevatormanagerscript
    Float currentTime = Utility.GetCurrentRealTime()
    Int I = actorsInManagerRoom.Length - 1
    While I >= 0
      loadelevatorloitererscript:actorentrydata data = actorsInManagerRoom[I]
      Bool inTrigger = Self.IsInTrigger(data.actorRef as ObjectReference)
      Float durationInTrigger = currentTime - data.entryTime
      If inTrigger
        If durationInTrigger >= LoadElevatorLoiteringLimitSeconds.value
          loadElevatorManager.TravelToRandomFloor(data.actorRef as ObjectReference)
          actorsInManagerRoom.remove(I, 1)
        EndIf
      Else
        actorsInManagerRoom.remove(I, 1)
      EndIf
      I = -1
    EndWhile
  EndIf
EndEvent
