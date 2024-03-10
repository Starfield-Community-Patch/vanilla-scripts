ScriptName LegendaryOnHitEffectStaggerScript Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ChanceLargeStagger = 5 Auto Const
Int Property ChanceMediumStagger = 10 Auto Const
Int Property ChanceSmallStagger = 20 Auto Const
Explosion Property mod_Legendary_StaggerLarge_Explosion Auto Const mandatory
Explosion Property mod_Legendary_StaggerMedium_Explosion Auto Const mandatory
Explosion Property mod_Legendary_StaggerSmall_Explosion Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int roll = Utility.RandomInt(1, 100)
  If roll <= ChanceLargeStagger
    akTarget.placeAtMe(mod_Legendary_StaggerLarge_Explosion as Form, 1, False, False, True, None, None, True)
  ElseIf roll <= ChanceMediumStagger
    akTarget.placeAtMe(mod_Legendary_StaggerMedium_Explosion as Form, 1, False, False, True, None, None, True)
  ElseIf roll <= ChanceSmallStagger
    akTarget.placeAtMe(mod_Legendary_StaggerSmall_Explosion as Form, 1, False, False, True, None, None, True)
  EndIf
EndEvent
