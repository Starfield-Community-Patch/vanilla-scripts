ScriptName Fragments:Quests:QF_SE_GenericDerelict_Geneta_000F2E6B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_GenericDerelict_GeneTagGlobal Auto Const mandatory
MiscObject Property SE_GenericDerelict_Genetag Auto Const mandatory
ReferenceAlias Property Alias_Mourner_UC01 Auto Const mandatory
ReferenceAlias Property Alias_Mourner Auto Const mandatory
ReferenceAlias Property Alias_Mourner_Freestar Auto Const mandatory
ReferenceAlias Property Alias_AkilaSanctumMarker Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisHoEMarker Auto Const mandatory
ReferenceAlias Property Alias_CydoniaMarker Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisSanctumMarker Auto Const mandatory
ReferenceAlias Property Alias_IDCard Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard01 Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard02 Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard03 Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference MournerRef = Alias_Mourner_UC01.GetRef()
  ObjectReference SandboxRef = Alias_NewAtlantisSanctumMarker.GetRef()
  Alias_Mourner.ForceRefTo(MournerRef)
  MournerRef.EnableNoWait(False)
  MournerRef.SetLinkedRef(SandboxRef, None, True)
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard01 as Form, Alias_IDCard as Alias, 1, True)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference MournerRef = Alias_Mourner_UC01.GetRef()
  ObjectReference SandboxRef = Alias_NewAtlantisHoEMarker.GetRef()
  Alias_Mourner.ForceRefTo(MournerRef)
  MournerRef.EnableNoWait(False)
  MournerRef.SetLinkedRef(SandboxRef, None, True)
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard02 as Form, Alias_IDCard as Alias, 1, True)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference MournerRef = Alias_Mourner_Freestar.GetRef()
  ObjectReference SandboxRef = Alias_CydoniaMarker.GetRef()
  Alias_Mourner.ForceRefTo(MournerRef)
  MournerRef.EnableNoWait(False)
  MournerRef.SetLinkedRef(SandboxRef, None, True)
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard03 as Form, Alias_IDCard as Alias, 1, True)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  ObjectReference MournerRef = Alias_Mourner_Freestar.GetRef()
  ObjectReference SandboxRef = Alias_AkilaSanctumMarker.GetRef()
  Alias_Mourner.ForceRefTo(MournerRef)
  MournerRef.EnableNoWait(False)
  MournerRef.SetLinkedRef(SandboxRef, None, True)
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard04 as Form, Alias_IDCard as Alias, 1, True)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  SE_GenericDerelict_GeneTagGlobal.SetValue(100.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  SE_GenericDerelict_GeneTagGlobal.SetValue(0.0)
  Game.GetPlayer().RemoveItem(Alias_IDCard.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Mourner.GetRef().DisableNoWait(False)
  SE_GenericDerelict_GeneTagGlobal.SetValue(0.0)
  Self.Stop()
EndFunction
