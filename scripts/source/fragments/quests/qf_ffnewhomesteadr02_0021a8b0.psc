ScriptName Fragments:Quests:QF_FFNewHomesteadR02_0021A8B0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Giuliana Auto Const mandatory
GlobalVariable Property FFNewHomesteadR02_NumTimesCompleted Auto Const mandatory
Armor Property Clothes_Monster_Costume Auto Const mandatory
ReferenceAlias Property Alias_MonsterCostume Auto Const mandatory
Scene Property FFNewHomesteadR02_0400_TouristsScene Auto Const mandatory
Quest Property FFNewHomesteadR02Misc Auto Const mandatory
RefCollectionAlias Property Alias_AllOtherTourists Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Giuliana.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_AllOtherTourists.DisableAll(False)
  If FFNewHomesteadR02Misc.IsRunning()
    FFNewHomesteadR02Misc.SetStage(1000)
  EndIf
  Actor myPlayer = Game.GetPlayer()
  myPlayer.AddAliasedItem(Clothes_Monster_Costume as Form, Alias_MonsterCostume as Alias, 1, False)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  ffnewhomesteadr02questscript kmyQuest = __temp as ffnewhomesteadr02questscript
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  kmyQuest.CheckDistanceForTourists()
EndFunction

Function Fragment_Stage_0400_Item_00()
  FFNewHomesteadR02_0400_TouristsScene.Start()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  ffnewhomesteadr02questscript kmyQuest = __temp as ffnewhomesteadr02questscript
  Alias_AllOtherTourists.EnableAll(False)
  Game.GetPlayer().RemoveItem(Alias_MonsterCostume.GetRef() as Form, 1, False, None)
  kmyQuest.SetCooldown()
  FFNewHomesteadR02_NumTimesCompleted.Mod(1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
