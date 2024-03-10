ScriptName Fragments:Quests:QF_BE_DerelictCreatures02_0013EC40 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
ActorValue Property PSpaceshipCrew Auto Const mandatory
GlobalVariable Property PBE_DerelictCreaturesMax Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  spaceshipreference enemyShipRef = Alias_enemyShip.GetRef() as spaceshipreference
  Int NumCrew = enemyShipRef.GetBaseValue(PSpaceshipCrew) as Int
  Int maxCreatures = PBE_DerelictCreaturesMax.GetValue() as Int
  If NumCrew >= maxCreatures
    NumCrew = maxCreatures
  EndIf
  kmyQuest.SetupGenericCrew(kmyQuest.CrewData, 0.0, NumCrew, kmyQuest.CONST_SpawnPattern_Random, kmyQuest.CONST_SpawnPrioritization_None, False)
EndFunction
