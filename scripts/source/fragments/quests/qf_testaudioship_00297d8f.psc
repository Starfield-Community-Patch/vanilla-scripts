ScriptName Fragments:Quests:QF_TestAudioShip_00297D8F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Scene Property TestAudioScene Auto Const mandatory
ReferenceAlias Property TestAudioActor Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  TestAudioScene.Stop()
  TestAudioActor.ForceRefTo((Alias_Ship01.GetRef() as spaceshipreference) as ObjectReference)
  TestAudioScene.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipREF = Alias_Ship01.GetRef() as spaceshipreference
  ShipREF.SetValue(Aggression, 2.0)
  ShipREF.AddToFaction(PlayerEnemyFaction)
EndFunction
