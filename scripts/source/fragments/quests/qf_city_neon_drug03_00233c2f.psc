ScriptName Fragments:Quests:QF_City_Neon_Drug03_00233C2F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Neon_Drug03_AuroraStash Auto Const mandatory
ReferenceAlias Property Alias_CacheContainer Auto Const mandatory
ReferenceAlias Property Alias_YannickStash Auto Const mandatory
RefCollectionAlias Property Alias_Complication01Enemies Auto Const mandatory
Book Property Drug03_RobieStashLocationNote Auto Const mandatory
ReferenceAlias Property Alias_Yannick Auto Const mandatory
ReferenceAlias Property Alias_Robie Auto Const mandatory
ObjectReference Property Drug01_YannickStart_Marker Auto Const mandatory
GlobalVariable Property Neon_Drug03_Count Auto Const mandatory
Quest Property City_Neon_Drug_Game Auto Const mandatory
GlobalVariable Property Neon_Drug03_Complication Auto Const mandatory
ReferenceAlias Property Alias_Complication03Beggar Auto Const mandatory
RefCollectionAlias Property Alias_Complication03Enemies Auto Const mandatory
GlobalVariable Property Neon_Drug03_BeggarBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Quest Property City_Neon_Drug02 Auto Const mandatory
Cell Property LC168Xenofresh Auto Const mandatory
ObjectReference Property Drug02_FinaleInsideGuardREF Auto Const mandatory
ObjectReference Property Drug02_FinaleInsideGuardREF001 Auto Const mandatory
Message Property Drug03_AuroraFinalMessage Auto Const mandatory
GlobalVariable Property Drug03_RecipeDone Auto Const mandatory
GlobalVariable Property Neon_Drug03_CooldownTimestamp Auto Const mandatory
city_neon_drug03miscscript Property City_Neon_Drug03Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Yannick.GetRef(), 0.0, 0.0, 0.0, True, False)
  DialogueFCNeon.SetStage(490)
  LC168Xenofresh.SetPublic(True)
  City_Neon_Drug02.SetStage(300)
  City_Neon_Drug02.SetStage(600)
  City_Neon_Drug02.SetStage(9000)
  Drug02_FinaleInsideGuardREF001.Disable(False)
  Drug02_FinaleInsideGuardREF.Disable(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  If Neon_Drug03_Count.GetValue() == 0.0
    Self.SetStage(50)
  EndIf
  Int nPreviousComplication = Neon_Drug03_Complication.GetValue() as Int
  Int nNewComplicationRoll = Utility.RandomInt(1, 7)
  If nNewComplicationRoll == nPreviousComplication
    nNewComplicationRoll = 2
  EndIf
  If nNewComplicationRoll > 4
    nNewComplicationRoll = 2
  EndIf
  Neon_Drug03_Complication.SetValue(nNewComplicationRoll as Float)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(100, True, False)
  City_Neon_Drug03Misc.Start()
  City_Neon_Drug03Misc.ClearShiftTimer()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
  City_Neon_Drug_Game.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Robie.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_CacheContainer.GetRef().Enable(False)
  Int nComplication = Neon_Drug03_Complication.GetValue() as Int
  If nComplication != 3
    Alias_CacheContainer.GetRef().AddAliasedItem(Neon_Drug03_AuroraStash as Form, Alias_YannickStash as Alias, 1, True)
  EndIf
  If nComplication == 1
    Alias_Complication01Enemies.EnableAll(False)
  ElseIf nComplication == 3
    ObjectReference oBeggar = Alias_Complication03Beggar.GetRef()
    oBeggar.AddAliasedItem(Neon_Drug03_AuroraStash as Form, Alias_YannickStash as Alias, 1, True)
    oBeggar.Enable(False)
  ElseIf nComplication == 4
    Alias_Complication03Enemies.EnableAll(False)
  EndIf
EndFunction

Function Fragment_Stage_0350_Item_00()
  (Alias_Complication03Beggar.GetRef() as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(360, True, False)
EndFunction

Function Fragment_Stage_0370_Item_00()
  Actor aPC = Game.GetPlayer()
  aPC.RemoveItem(Credits as Form, Neon_Drug03_BeggarBribe.GetValue() as Int, False, None)
  aPC.AddItem(Alias_YannickStash.GetRef() as Form, 1, False)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0385_Item_00()
  Actor aPC = Game.GetPlayer()
  aPC.AddItem(Alias_YannickStash.GetRef() as Form, 1, False)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_Robie.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.CompleteAllObjectives()
  Neon_Drug03_Count.Mod(1.0)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.CompleteAllObjectives()
  Neon_Drug03_Count.Mod(1.0)
  Game.GetPlayer().RemoveItem(Neon_Drug03_AuroraStash as Form, 1, False, None)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_8900_Item_00()
  Alias_CacheContainer.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  City_Neon_Drug03Misc.StartShiftTimer()
  If Drug03_RecipeDone.GetValue() == 0.0
    Drug03_AuroraFinalMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Drug03_RecipeDone.SetValue(1.0)
  EndIf
  Utility.Wait(1.0)
  Self.Stop()
EndFunction
