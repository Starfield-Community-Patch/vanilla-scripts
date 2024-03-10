ScriptName Fragments:Quests:QF_RL082_EavesdroppingSceneT_002B8950 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HavokObject Auto Const mandatory
Explosion Property OxygenTankExplosion01 Auto Const
Cell Property RL082TAWarehouse Auto Const
ReferenceAlias Property Alias_AirlockDoor01 Auto Const mandatory
ReferenceAlias Property Alias_AirlockDoor02 Auto Const mandatory
ReferenceAlias Property Alias_HavokObject01 Auto Const mandatory
Spell Property GEN_PointGravity_LG Auto Const
ReferenceAlias Property Alias_PointGravMarker Auto Const mandatory
Key Property RL082StorageKey Auto Const
ReferenceAlias Property Alias_DialgoueActor Auto Const mandatory
Scene Property RL082_EavesdroppingScene_Explosion02 Auto Const
ReferenceAlias Property Alias_BreachAudio Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_DialgoueActor.getactorref().SetRestrained(True)
  Alias_DialgoueActor.getactorref().SetValue(Game.GetHealthAV(), 5.0)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_DialgoueActor.getactorref().RemoveItem(RL082StorageKey as Form, 1, False, None)
  Game.getplayer().additem(RL082StorageKey as Form, 1, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  RL082_EavesdroppingScene_Explosion02.Start()
EndFunction

Function Fragment_Stage_0027_Item_00()
  GEN_PointGravity_LG.Cast(Alias_PointGravMarker.getref(), None)
  Alias_PointGravMarker.getref().PlaceAtMe(OxygenTankExplosion01 as Form, 1, False, False, True, None, None, True)
  Game.ShakeCamera(None, 0.5, 0.0)
  Alias_BreachAudio.getref().Enable(False)
  Utility.wait(2.0)
  RL082TAWarehouse.SetGravityScale(0.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_BreachAudio.getref().Disable(False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(20, True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveFailed(10, True)
  Self.SetObjectiveFailed(20, True)
  Self.Stop()
EndFunction
