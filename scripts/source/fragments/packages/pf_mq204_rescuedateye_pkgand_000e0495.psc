ScriptName Fragments:Packages:PF_MQ204_RescuedAtEye_PkgAnd_000E0495 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property AnimFlavorWounded Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Change(Actor akActor)
  akActor.ChangeAnimFlavor(None)
EndFunction

Function Fragment_End(Actor akActor)
  akActor.ChangeAnimFlavor(AnimFlavorWounded)
EndFunction
