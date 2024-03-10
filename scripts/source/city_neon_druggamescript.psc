ScriptName City_Neon_DrugGameScript Extends Quest

;-- Structs -----------------------------------------
Struct HopperItem
  MiscObject hopperIngredient
  Int countGiven = 0
  Int countNeeded = 0
EndStruct

Struct RewardItem
  Message rewardMessage
  GlobalVariable rewardCredits
EndStruct


;-- Variables ---------------------------------------
Int maxRefills = 2
Bool playerAllowedRefill = False
Bool playerSucceeded = False

;-- Properties --------------------------------------
Group stages
  Int Property StageRoundStart = 100 Auto Const
  Int Property StageUsedHalfTime = 190 Auto Const
  Int Property StageUsedAllTime = 200 Auto Const
  Int Property StageUsedWrongIngredients = 280 Auto Const
  { stage to set if player took the wrong ingredients from the hopper }
  Int Property StageRoundFail = 325 Auto Const
  { stage to set if player failed completely - didn't deliver drug to assembly container }
  Int Property StageRoundFinish = 300 Auto Const
  Int Property StageGameComplete = 400 Auto Const
  { stage set when game is complete, whether or not player succeeded or not }
  Int Property City_Neon_Drug02_FinalRoundSuccessStage = 450 Auto Const
  { stage to set on City_Neon_Drug02 when player succeeds in the final round }
  Int Property City_Neon_Drug02_FinishGameStage = 460 Auto Const
  { stage to set on City_Neon_Drug02 when player finishes game }
  Int Property City_Neon_Drug03_FinalRoundSuccessStage = 200 Auto Const
  { stage to set on City_Neon_Drug02 when player succeeds in the final round }
  Int Property City_Neon_Drug03_FinishGameStage = 210 Auto Const
  { stage to set on City_Neon_Drug03 when player finishes game }
EndGroup

Group objectives
  Int Property City_Neon_Drug02_ObjectiveRound1 = 440 Auto Const
  Int Property City_Neon_Drug02_ObjectiveRound2 = 445 Auto Const
  Int Property City_Neon_Drug02_ObjectiveRound3 = 450 Auto Const
  Int Property City_Neon_Drug03_ObjectiveRound1 = 150 Auto Const
  Int Property City_Neon_Drug03_ObjectiveRound2 = 155 Auto Const
  Int Property City_Neon_Drug03_ObjectiveRound3 = 160 Auto Const
EndGroup

city_neon_drug02_script Property City_Neon_Drug02 Auto Const mandatory
city_neon_drug03_script Property City_Neon_Drug03 Auto Const mandatory
ReferenceAlias Property Alias_IngredientHopper Auto Const mandatory
ReferenceAlias Property Alias_AssemblyHopper Auto Const mandatory
ReferenceAlias Property Alias_ConveyorBelt Auto Const mandatory
GlobalVariable Property Neon_Drug_ManufactureCount Auto Const mandatory
{ track current round }
GlobalVariable Property Neon_Drug_RetryCount Auto Const mandatory
{ track number of retries }
Scene Property City_Neon_Drug_Game_120_Aurora01 Auto Const mandatory
{ scene that tracks game progress }
Scene Property City_Neon_Drug_Game_Drug03_GameOVer Auto Const mandatory
Message Property Neon_Drug_07_ShiftFailed Auto Const mandatory
city_neon_druggamescript:hopperitem[] Property HopperItems Auto Const mandatory
city_neon_druggamescript:rewarditem[] Property Rewards Auto Const mandatory
{ array of reward levels, ordered from worst (0) to best }
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Int currentRetryCount = Neon_Drug_RetryCount.GetValueInt()
  If City_Neon_Drug02.IsRunning()
    maxRefills = City_Neon_Drug02.maxRefills
  Else
    maxRefills = City_Neon_Drug03.maxRefills
  EndIf
  If currentRetryCount < maxRefills
    playerAllowedRefill = True
  EndIf
  Alias_AssemblyHopper.GetRef().RemoveAllItems(None, False, False)
  If playerAllowedRefill
    Alias_IngredientHopper.GetRef().RemoveAllItems(None, False, False)
    ObjectReference hopperRef = Alias_IngredientHopper.GetRef()
    Int I = 0
    While I < HopperItems.Length
      city_neon_druggamescript:hopperitem theHopperItem = HopperItems[I]
      hopperRef.AddItem(theHopperItem.hopperIngredient as Form, theHopperItem.countGiven, False)
      I += 1
    EndWhile
  EndIf
  Self.SetStage(StageRoundStart)
  City_Neon_Drug_Game_120_Aurora01.Start()
EndEvent

Function ValidateItemsUsed()
  Int manufactureCount = Neon_Drug_ManufactureCount.GetValueInt()
  ObjectReference hopperRef = Alias_IngredientHopper.GetRef()
  City_Neon_Drug_Game_120_Aurora01.Stop()
  Int I = 0
  While I < HopperItems.Length && Self.GetStageDone(StageUsedWrongIngredients) == False
    city_neon_druggamescript:hopperitem theHopperItem = HopperItems[I]
    Int amountInHopper = hopperRef.GetItemCount(theHopperItem.hopperIngredient as Form)
    Int amountShouldBeLeft = theHopperItem.countGiven - theHopperItem.countNeeded
    If amountInHopper < amountShouldBeLeft
      Self.SetStage(StageUsedWrongIngredients)
    EndIf
    I += 1
  EndWhile
  Self.SetStage(StageRoundFinish)
EndFunction

Function RewardPlayer()
  playerSucceeded = True
  Int rewardIndex = 0
  If Self.GetStageDone(StageUsedAllTime) || Neon_Drug_RetryCount.GetValue() > 0.0
    
  ElseIf Self.GetStageDone(StageUsedWrongIngredients)
    rewardIndex = 1
  ElseIf Self.GetStageDone(StageUsedHalfTime) == True
    rewardIndex = 2
  Else
    rewardIndex = 3
  EndIf
  city_neon_druggamescript:rewarditem theReward = Rewards[rewardIndex]
  theReward.rewardMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Game.GetPlayer().AddItem(Credits as Form, theReward.rewardCredits.GetValueInt(), False)
  Self.SetStage(StageGameComplete)
EndFunction

Function Cleanup()
  Alias_ConveyorBelt.GetRef().PlayAnimation("play02")
  Utility.Wait(3.0)
  Alias_AssemblyHopper.GetRef().RemoveAllItems(None, False, False)
  Int manufactureCount = Neon_Drug_ManufactureCount.GetValueInt()
  If manufactureCount == 0
    If playerSucceeded
      If City_Neon_Drug02.IsRunning()
        City_Neon_Drug02.SetObjectiveCompleted(City_Neon_Drug02_ObjectiveRound1, True)
        City_Neon_Drug02.SetObjectiveDisplayed(City_Neon_Drug02_ObjectiveRound2, True, False)
      ElseIf City_Neon_Drug03.IsRunning()
        City_Neon_Drug03.SetObjectiveCompleted(City_Neon_Drug03_ObjectiveRound1, True)
        City_Neon_Drug03.SetObjectiveDisplayed(City_Neon_Drug03_ObjectiveRound2, True, False)
      EndIf
    EndIf
  ElseIf manufactureCount == 1
    If playerSucceeded
      If City_Neon_Drug02.IsRunning()
        City_Neon_Drug02.SetObjectiveCompleted(City_Neon_Drug02_ObjectiveRound2, True)
        City_Neon_Drug02.SetObjectiveDisplayed(City_Neon_Drug02_ObjectiveRound3, True, False)
      ElseIf City_Neon_Drug03.IsRunning()
        City_Neon_Drug03.SetObjectiveCompleted(City_Neon_Drug03_ObjectiveRound2, True)
        City_Neon_Drug03.SetObjectiveDisplayed(City_Neon_Drug03_ObjectiveRound3, True, False)
      EndIf
    EndIf
  ElseIf playerSucceeded
    If City_Neon_Drug02.IsRunning()
      City_Neon_Drug02.SetStage(City_Neon_Drug02_FinalRoundSuccessStage)
    ElseIf City_Neon_Drug03.IsRunning()
      City_Neon_Drug_Game_Drug03_GameOVer.Start()
      Utility.Wait(5.0)
      City_Neon_Drug03.SetStage(City_Neon_Drug03_FinalRoundSuccessStage)
    EndIf
  EndIf
  If playerSucceeded
    Neon_Drug_ManufactureCount.Mod(1.0)
    Neon_Drug_RetryCount.SetValue(0.0)
  Else
    Neon_Drug_RetryCount.Mod(1.0)
    Utility.Wait(3.0)
    Neon_Drug_07_ShiftFailed.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
  manufactureCount = Neon_Drug_ManufactureCount.GetValueInt()
  If manufactureCount < 3
    If City_Neon_Drug02.IsRunning()
      City_Neon_Drug02.ReplayGame()
    ElseIf City_Neon_Drug03.IsRunning()
      City_Neon_Drug03.ReplayGame()
    EndIf
  Else
    If City_Neon_Drug02.IsRunning()
      City_Neon_Drug02.SetStage(City_Neon_Drug02_FinishGameStage)
    ElseIf City_Neon_Drug03.IsRunning()
      City_Neon_Drug03.SetStage(City_Neon_Drug03_FinishGameStage)
    EndIf
    Neon_Drug_ManufactureCount.SetValue(0.0)
    Self.Stop()
  EndIf
EndFunction
