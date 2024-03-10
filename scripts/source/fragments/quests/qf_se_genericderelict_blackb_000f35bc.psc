ScriptName Fragments:Quests:QF_SE_GenericDerelict_BlackB_000F35BC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Blackbox Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const mandatory
MiscObject Property SE_GenericDerelict_BlackBox Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  SE_GenericDerelict_BlackboxGlobal.SetValue(100.0)
  Self.SetObjectiveDisplayed(10, True, False)
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_BlackBox as Form, Alias_Blackbox as Alias, 1, True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  SE_GenericDerelict_BlackboxGlobal.SetValue(0.0)
  Game.GetPlayer().RemoveItem(Alias_Blackbox.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(SE_GenericDerelict_BlackBox as Form, 99, False, None)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
