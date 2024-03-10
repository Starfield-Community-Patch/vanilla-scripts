ScriptName DefaultAliasReadWhileSittingScript Extends ReferenceAlias Const default
{ script to get an NPC to read in a chair }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Package[] Property ReadingPackages Auto Const
{ list of packages where you want the NPC reading while sitting }
Idle Property IdleBookReadStart Auto Const

;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  Actor theActor = Self.GetActorRef()
  If theActor
    Package currentPackage = Self.GetActorRef().GetCurrentPackage()
    Int packageIndex = ReadingPackages.find(currentPackage, 0)
    If packageIndex > -1
      theActor.PlayIdle(IdleBookReadStart)
    EndIf
  EndIf
EndEvent
