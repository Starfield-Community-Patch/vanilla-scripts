ScriptName TargetingSkillPlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard MyGuard

;-- Properties --------------------------------------
ActorValue Property TargetCountAV Auto Const mandatory

;-- Functions ---------------------------------------

Bool Function TryToModifyTargetCount(Int targetCountModifier, Int MaxTargetCount)
  Guard MyGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor player = Game.GetPlayer()
    Float currentCount = player.GetValue(TargetCountAV)
    Bool shouldmodify = True
    If targetCountModifier > 0
      shouldmodify = currentCount < MaxTargetCount as Float
    Else
      shouldmodify = currentCount > 0.0
    EndIf
    If shouldmodify
      player.SetValue(TargetCountAV, currentCount + targetCountModifier as Float)
    EndIf
    Return shouldmodify
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
