ScriptName Fragments:Quests:QF_MB_Sabotage01_RIR04_0013F73D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_RadiantSupport Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRef Auto Const mandatory
ReferenceAlias Property Alias_DevicePlacementTrigger Auto Const mandatory
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRefLinkedRef Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.SetRewardValues()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  ObjectReference TriggerRef = Alias_DevicePlacementTrigger.GetRef()
  ObjectReference MarkerRef = Alias_PrimaryRef.GetRef()
  Location MyLocation = MarkerRef.GetCurrentLocation()
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
    TriggerRef.SetFactionOwner(CrimeFactionNeon, False)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword)
    TriggerRef.SetFactionOwner(CrimeFactionFreestar, False)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
    TriggerRef.SetFactionOwner(CrimeFactionUC, False)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference MarkerRef = Alias_PrimaryRef.GetRef()
  Alias_PrimaryRefLinkedRef.ForceRefTo(MarkerRef.GetLinkedRef(None))
  Alias_Guard.GetRef().MoveTo(Alias_PrimaryRefLinkedRef.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionsabotagequestscript kmyQuest = __temp as missionsabotagequestscript
  (RI_RadiantSupport as ri_radiantsupportquestscript).MBCompleted()
  kmyQuest.MissionComplete()
EndFunction
