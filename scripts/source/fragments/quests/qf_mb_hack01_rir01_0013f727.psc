ScriptName Fragments:Quests:QF_MB_Hack01_RIR01_0013F727 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_RadiantSupport Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRef Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
ReferenceAlias Property Alias_DataDisk Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.SetRewardValues()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  ObjectReference TerminalRef = Alias_PrimaryRef.GetRef()
  TerminalRef.Lock(True, False, True)
  TerminalRef.SetLockLevel(25)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddItem(Alias_DataDisk.GetRef() as Form, 1, False)
  PlayerRef.AddItem(Digipick as Form, 2, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionhackquestscript kmyQuest = __temp as missionhackquestscript
  (RI_RadiantSupport as ri_radiantsupportquestscript).MBCompleted()
  kmyQuest.MissionComplete()
EndFunction
