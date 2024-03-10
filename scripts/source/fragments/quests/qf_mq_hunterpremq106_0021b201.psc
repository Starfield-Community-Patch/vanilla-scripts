ScriptName Fragments:Quests:QF_MQ_HunterPreMQ106_0021B201 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
ObjectReference Property PreMQ106_NA_HunterMarker Auto Const mandatory
ObjectReference Property PreMQ106_Akila_HunterMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  HunterREF.Disable(False)
  HunterREF.moveto(PreMQ106_NA_HunterMarker, 0.0, 0.0, 0.0, True, False)
  HunterREF.Enable(False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  HunterREF.Disable(False)
  HunterREF.moveto(PreMQ106_Akila_HunterMarker, 0.0, 0.0, 0.0, True, False)
  HunterREF.Enable(False)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  HunterREF.Disable(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  HunterREF.Disable(False)
  Self.Stop()
EndFunction
