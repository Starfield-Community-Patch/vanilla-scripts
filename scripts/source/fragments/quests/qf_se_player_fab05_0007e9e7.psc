ScriptName Fragments:Quests:QF_SE_Player_FAB05_0007E9E7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_Grandma Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property SE_Player_FAB05_GrandmaDead Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  SE_Player_FAB05_GrandmaDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0006_Item_00()
  SE_Player_FAB05_GrandmaDead.SetValue(1.0)
  spaceshipreference GrandmaRef = Alias_HailingShip.GetShipRef()
  GrandmaRef.SetValue(SpaceshipCrew, 0.0)
  GrandmaRef.SetValue(Aggression, 0.0)
  GrandmaRef.StopCombat()
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  Actor GrandmaRef = Alias_Grandma.GetActorRef()
  spaceshipreference GrandmaShipRef = Alias_HailingShip.GetShipRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  GrandmaRef.AddtoFaction(PlayerEnemyFaction)
  GrandmaRef.SetValue(Aggression, 1.0)
  GrandmaShipRef.AddtoFaction(PlayerEnemyFaction)
  GrandmaShipRef.SetValue(Aggression, 1.0)
  If GrandmaRef.GetParentCell() == PlayerRef.GetParentCell()
    GrandmaRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
