ScriptName Fragments:Quests:QF_LC115_0022F263 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ArmoryDoor Auto Const mandatory
Faction Property LC115SeokguhCrimeFaction Auto Const
Faction Property LC115SeokguhNeutralFaction Auto Const
Faction Property LC115SeokguhTrespassFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
RefCollectionAlias Property Alias_SeokguhActorsTrespassAll Auto Const mandatory
RefCollectionAlias Property Alias_SeokguhActorsTrespass3rdFloor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Alias_SeokguhActorsTrespass3rdFloor.AddRefCollection(Alias_SeokguhActorsTrespassAll)
  Alias_SeokguhActorsTrespassAll.RemoveAll()
  Alias_SeokguhActorsTrespass3rdFloor.EvaluateAll()
  Alias_ArmoryDoor.getref().unlock(False)
  Alias_ArmoryDoor.getref().setopen(True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
