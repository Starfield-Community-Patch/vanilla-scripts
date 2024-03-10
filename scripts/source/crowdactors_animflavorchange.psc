ScriptName CrowdActors_AnimFlavorChange Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword[] Property AnimFlavors Auto Const
{ array of anim flavor keywords }
GlobalVariable Property CrowdAnimFlavorChance Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Int ChanceForAnim = Utility.RandomInt(0, 100)
  If ChanceForAnim as Float > CrowdAnimFlavorChance.GetValue()
    Int AnimType = Utility.RandomInt(0, AnimFlavors.Length - 1)
    Self.ChangeAnimFlavor(AnimFlavors[AnimType])
  EndIf
EndEvent
