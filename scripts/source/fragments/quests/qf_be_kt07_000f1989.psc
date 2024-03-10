ScriptName Fragments:Quests:QF_BE_KT07_000F1989 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
RefCollectionAlias Property Alias_GenericRobots Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property UCSecurityFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PodRobot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor[] RobotsRef = Alias_GenericRobots.GetActorArray()
  Alias_GenericRobots.AddRef(Alias_PodRobot.GetRef())
  Int I = 0
  While I < RobotsRef.Length
    RobotsRef[I].RemoveFromFaction(CrimeFactionUC)
    RobotsRef[I].RemoveFromFaction(UCSecurityFaction)
    RobotsRef[I].AddtoFaction(PlayerEnemyFaction)
    RobotsRef[I].SetValue(Aggression, 2.0)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0020_Item_00()
  (Alias_PodRobot.GetRef() as robotpodscript).WakeRobotFromPod()
EndFunction
