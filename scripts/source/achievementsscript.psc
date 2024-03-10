ScriptName AchievementsScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct StatAchievement
  String StatName
  { Name of the stat }
  Int Threshold
  { If the stat is equal to or greater than this, unlock the achievement }
  Int AchievementNumber
  { The achievement to unlock }
EndStruct


;-- Variables ---------------------------------------
Bool bCraftedItemsAwarded
Bool bFutureRetro
Bool initialized
Int nBobbleHead01 = 10 Const
Int nBobbleHead02 = 20 Const
Int nCraftedItems = 100 Const
Int nCurrentChems
Int nCurrentFood
String sBobbleheadsCollectedStat = "Bobbleheads Collected" Const
String sChemsCraftedStat = "Chems Crafted" Const
String sFoodCookedStat = "Food Cooked" Const

;-- Properties --------------------------------------
achievementsscript:statachievement[] Property StatAchievements Auto Const mandatory
{ All the simple "stat is equal or larger than x" achivements - must be unique stats and not overlap with future retro or other achivements }
String[] Property FutureRetroStats Auto Const mandatory
{ All the stats that will trigger the future retro achivement - must be unique stats and not overlap with other achivements }
Int Property nNumberOfCompanions Auto conditional hidden
Int Property nGiantsKilled Auto conditional hidden

;-- Functions ---------------------------------------

Function InitializeQuest()
  If initialized
    Return 
  EndIf
  Self.RegisterEvents()
  initialized = True
EndFunction

Function RegisterEvents()
  Int index = 0
  While index < StatAchievements.Length
    achievementsscript:statachievement curAchivement = StatAchievements[index]
    Self.RegisterForTrackedStatsEvent(curAchivement.StatName, curAchivement.Threshold)
    index += 1
  EndWhile
  index = 0
  While index < FutureRetroStats.Length
    Self.RegisterForTrackedStatsEvent(FutureRetroStats[index], 1)
    index += 1
  EndWhile
  Self.RegisterForTrackedStatsEvent(sChemsCraftedStat, 1)
  Self.RegisterForTrackedStatsEvent(sFoodCookedStat, 1)
  Self.RegisterForTrackedStatsEvent(sBobbleheadsCollectedStat, nBobbleHead01)
EndFunction

Function UnregisterFutureRetroEvents()
  Int index = 0
  While index < FutureRetroStats.Length
    Self.UnregisterForTrackedStatsEvent(FutureRetroStats[index])
    index += 1
  EndWhile
EndFunction

Event OnTrackedStatsEvent(String statFilter, Int statValue)
  Bool handled = Self.HandleBasicStat(statFilter)
  handled = handled || Self.HandleRetroStat(statFilter)
  handled = handled || Self.HandleCraftedStat(statFilter, statValue)
  handled = handled || Self.HandleBobbleheadStat(statFilter, statValue)
EndEvent

Bool Function HandleBasicStat(String statFilter)
  Int achievementIndex = StatAchievements.findstruct("StatName", statFilter, 0)
  If achievementIndex >= 0
    Game.AddAchievement(StatAchievements[achievementIndex].AchievementNumber)
    Return True
  Else
    Return False
  EndIf
EndFunction

Bool Function HandleRetroStat(String statFilter)
  Int achievementIndex = FutureRetroStats.find(statFilter, 0)
  If achievementIndex >= 0
    If !bFutureRetro
      bFutureRetro = True
      Game.AddAchievement(35)
      Self.UnregisterFutureRetroEvents()
    EndIf
    Return True
  Else
    Return False
  EndIf
EndFunction

Bool Function HandleCraftedStat(String statFilter, Int statValue)
  If statFilter == sChemsCraftedStat
    nCurrentChems = statValue
    Self.UpdateCraftedAchievement(sChemsCraftedStat, nCurrentChems)
    Return True
  ElseIf statFilter == sFoodCookedStat
    nCurrentFood = statValue
    Self.UpdateCraftedAchievement(sFoodCookedStat, nCurrentFood)
    Return True
  Else
    Return False
  EndIf
EndFunction

Function UpdateCraftedAchievement(String statFilter, Int currentValue)
  If !bCraftedItemsAwarded
    If nCurrentChems + nCurrentFood >= nCraftedItems
      bCraftedItemsAwarded = True
      Game.AddAchievement(31)
      Self.UnregisterForTrackedStatsEvent(sChemsCraftedStat)
      Self.UnregisterForTrackedStatsEvent(sFoodCookedStat)
    Else
      Self.RegisterForTrackedStatsEvent(statFilter, currentValue + 1)
    EndIf
  EndIf
EndFunction

Bool Function HandleBobbleheadStat(String statFilter, Int statValue)
  If statFilter == sBobbleheadsCollectedStat
    Game.AddAchievement(44)
    If statValue >= nBobbleHead02
      Game.AddAchievement(45)
    Else
      Self.RegisterForTrackedStatsEvent(sBobbleheadsCollectedStat, nBobbleHead02)
    EndIf
    Return True
  Else
    Return False
  EndIf
EndFunction
