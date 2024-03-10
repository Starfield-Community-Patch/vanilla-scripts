ScriptName Fragments:Quests:QF_BE_MQ102_002A3901 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Moara Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Actor MoaraREF = Alias_Moara.GetActorRef()
  MoaraREF.Disable(False)
  MoaraREF.EvaluatePackage(False)
  MoaraREF.Moveto(Alias_CaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  MoaraREF.Enable(False)
EndFunction
