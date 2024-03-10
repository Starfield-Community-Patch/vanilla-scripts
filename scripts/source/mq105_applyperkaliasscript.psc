ScriptName MQ105_ApplyPerkAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property MQ105_CompanionStealth Auto Const mandatory
{ Perk to apply to the NPC }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor currAct = Self.GetActorRef()
  If currAct != None
    currAct.AddPerk(MQ105_CompanionStealth, False)
  EndIf
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  Actor currAct = akObject as Actor
  If currAct != None
    If abRemove
      If currAct.HasPerk(MQ105_CompanionStealth)
        currAct.RemovePerk(MQ105_CompanionStealth)
      EndIf
    ElseIf !currAct.HasPerk(MQ105_CompanionStealth)
      currAct.AddPerk(MQ105_CompanionStealth, False)
    EndIf
  EndIf
EndEvent

Event OnAliasShutdown()
  Actor currAct = Self.GetActorRef()
  If currAct != None && currAct.HasPerk(MQ105_CompanionStealth)
    currAct.RemovePerk(MQ105_CompanionStealth)
  EndIf
EndEvent
