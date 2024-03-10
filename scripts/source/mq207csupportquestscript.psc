ScriptName MQ207CSupportQuestScript Extends Quest
{ Quest script for MQ207C_Support, the quest that manages the pre- and post-quest dialogue for MQ207C. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  ReferenceAlias Property Alias_NishinaExt_I_ExteriorDoor Auto Const mandatory
  Scene Property MQ207C_110_EntranceIntercom Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Alias_NishinaExt_I_ExteriorDoor as ScriptObject, "OnActivate")
EndEvent

Event ReferenceAlias.OnActivate(ReferenceAlias source, ObjectReference akActivator)
  If source == Alias_NishinaExt_I_ExteriorDoor && (akActivator == Game.GetPlayer() as ObjectReference)
    MQ207C_110_EntranceIntercom.Start()
  EndIf
EndEvent

Function UnregisterForExteriorDoorEvents()
  Self.UnregisterForRemoteEvent(Alias_NishinaExt_I_ExteriorDoor as ScriptObject, "OnActivate")
EndFunction
