ScriptName City_Neon_Drug01_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Drug01_NesharAlias Auto Const
ReferenceAlias Property Drug01_NeonJailDoor Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Drug01_NeonJailDoor as ScriptObject, "OnActivate")
EndEvent

Event ReferenceAlias.OnActivate(ReferenceAlias source, ObjectReference akActivator)
  If source == Drug01_NeonJailDoor && (akActivator == Game.GetPlayer() as ObjectReference)
    Drug01_NesharAlias.GetActorRef().Activate(Game.GetPlayer() as ObjectReference, False)
  EndIf
EndEvent

Function UnregisterForExteriorDoorEvents()
  Self.UnregisterForRemoteEvent(Drug01_NeonJailDoor as ScriptObject, "OnActivate")
EndFunction
