ScriptName Fragments:Quests:QF_MB_PlantEvidence01_RIR02_0013F2C8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_RadiantSupport Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRef Auto Const mandatory
Keyword Property NoLoot Auto Const mandatory
ReferenceAlias Property Alias_Evidence Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.SetRewardValues()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  ObjectReference ContainerRef = Alias_PrimaryRef.GetRef()
  ContainerRef.Enable(False)
  ContainerRef.Lock(True, False, True)
  ContainerRef.SetLockLevel(25)
  Game.GetPlayer().AddItem(Digipick as Form, 2, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
  Self.SetStage(95)
  Alias_PrimaryRef.GetRef().RemoveItem(Alias_Evidence.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionplantevidencequestscript kmyQuest = __temp as missionplantevidencequestscript
  (RI_RadiantSupport as ri_radiantsupportquestscript).MBCompleted()
  kmyQuest.MissionComplete()
  Alias_PrimaryRef.GetRef().Disable(False)
EndFunction
