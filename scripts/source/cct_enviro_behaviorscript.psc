ScriptName CCT_Enviro_BehaviorScript Extends Quest Const
{ optional script for CCT_Enviro quests }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard abilityGuard

;-- Properties --------------------------------------
ReferenceAlias Property BehaviorActor Auto Const mandatory
{ behavior actor alias }
Spell Property BehaviorAbility Auto Const
{ optional ability to apply via function call }

;-- Functions ---------------------------------------

Function ApplyBehaviorAbility(Bool bApply)
  If BehaviorAbility
    Guard abilityGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Actor behaviorActorRef = BehaviorActor.GetActorRef()
      If bApply
        behaviorActorRef.AddSpell(BehaviorAbility, True)
      Else
        behaviorActorRef.RemoveSpell(BehaviorAbility)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction
