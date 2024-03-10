ScriptName Fragments:Quests:QF_FFKeyZ01_001BB164 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BogStartMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_MadeleineRing Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ReferenceAlias Property Alias_CFSD01Evidence Auto Const mandatory
ReferenceAlias Property Alias_ClayContainer Auto Const mandatory
ReferenceAlias Property Alias_Clay Auto Const mandatory
ReferenceAlias Property Alias_BossMarker Auto Const mandatory
ReferenceAlias Property Alias_BackupClay Auto Const mandatory
ReferenceAlias Property Alias_ClayLetter Auto Const mandatory
Faction Property SpacerFaction Auto Const mandatory
Faction Property EclipticFaction Auto Const mandatory
Book Property FFKeyZ01_ClayLetter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1)
  DialogueCFTheKey.SetStage(250)
  Game.GetPlayer().MoveTo(Alias_BogStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1)
  DialogueCFTheKey.SetStage(200)
  Self.SetStage(100)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(1)
  DialogueCFTheKey.SetStage(200)
  Self.SetStage(100)
  Self.SetStage(200)
  Game.GetPlayer().AddItem(Alias_MadeleineRing.GetRef() as Form, 1, False)
  Game.GetPlayer().MoveTo(Alias_BogStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor ClayRef = Alias_Clay.GetActorRef()
  Actor SpacerClayRef = Alias_BackupClay.GetActorRef()
  If Alias_BossMarker.GetActorRef().IsInFaction(SpacerFaction)
    SpacerClayRef.AddAliasedItem(FFKeyZ01_ClayLetter as Form, Alias_ClayLetter as Alias, 1, True)
    SpacerClayRef.EnableNoWait(False)
  Else
    ClayRef.AddAliasedItem(FFKeyZ01_ClayLetter as Form, Alias_ClayLetter as Alias, 1, True)
    ClayRef.EnableNoWait(False)
  EndIf
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetObjectiveCompleted(100, True)
  Alias_ClayContainer.GetRef().AddItem(Alias_CFSD01Evidence.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(Alias_MadeleineRing.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.Stop()
EndFunction
