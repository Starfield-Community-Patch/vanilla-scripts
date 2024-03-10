ScriptName Fragments:Quests:QF_SE_Player_DerelictShip__0001C02A_2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DerelictShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionCompanyGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionTypeGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardCauseGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_Repaired Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_MissionCrewTypeGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_IDCardGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_LogsDownloaded Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const mandatory
GlobalVariable Property BE_GenericDerelicCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalDockingGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewEquipmentGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalVoteTallyGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_UniqueEntry01Global Auto Const mandatory
FormList Property BEHazardKeywordList Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
sq_parentscript:actorvaluedatum[] Property AdditionalActorValuesToDamage Auto Const
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_CrewWoundedMarkers Auto Const mandatory
Furniture Property NPCWoundedLean Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  SQ_Parent.SetupDamagedShip(Alias_DerelictShip.GetShipRef(), False, True, True, True, True, True, AdditionalActorValuesToDamage)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_DerelictShip.GetShipRef().SetValue(DockingPermission, 0.0)
  SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(Utility.RandomInt(0, 3) as Float)
  SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0, 4))
  SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0, 11))
  SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0, 2))
  SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0, 1))
  SE_GenericDerelict_Repaired.SetValue(0.0)
  SE_GenericDerelict_LogsDownloaded.SetValue(0.0)
  SE_GenericDerelict_HazardFixed.SetValue(0.0)
  SE_GenericDerelict_TerminalGlobal.SetValue(0.0)
  SE_GenericDerelict_TerminalCrewGlobal.SetValue(0.0)
  SE_GenericDerelict_TerminalDockingGlobal.SetValue(0.0)
  SE_GenericDerelict_TerminalCrewEquipmentGlobal.SetValue(0.0)
  SE_GenericDerelict_TerminalVoteTallyGlobal.SetValue(0.0)
  ObjectReference[] FurnitureRef = Alias_CrewSpawnMarkers.GetArray()
  Int I = 0
  While I < FurnitureRef.Length
    Alias_CrewWoundedMarkers.AddRef(FurnitureRef[I].PlaceAtMe(NPCWoundedLean as Form, 1, False, False, True, None, None, True))
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0020_Item_00()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[]
  spaceshipreference DerelictShip = Alias_DerelictShip.GetShipRef()
  Int biohazard = Utility.RandomInt(0, 2)
  If biohazard == 0
    DerelictShip.AddKeyword(hazardKeywords[11])
  ElseIf biohazard == 1
    DerelictShip.AddKeyword(hazardKeywords[8])
  Else
    DerelictShip.AddKeyword(hazardKeywords[10])
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_01()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[]
  Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[8])
EndFunction

Function Fragment_Stage_0020_Item_02()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[]
  Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[6])
EndFunction

Function Fragment_Stage_0020_Item_03()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[]
  Int biohazard = Utility.RandomInt(0, 1)
  If biohazard == 1
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[4])
  Else
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[24])
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_04()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[]
  Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[3])
EndFunction

Function Fragment_Stage_0020_Item_05()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[]
  Int biohazard = Utility.RandomInt(0, 1)
  If biohazard == 1
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[5])
  Else
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[0])
  EndIf
EndFunction
