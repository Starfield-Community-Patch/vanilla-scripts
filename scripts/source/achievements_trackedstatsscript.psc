ScriptName Achievements_TrackedStatsScript Extends Quest Const
{ Track player stats for awarding achievements }

;-- Structs -----------------------------------------
Struct ChallengeAchievement
  challenge AchievementChallenge
  { Challenge to trigger }
  Int AchievementNumber
  { The achievement to unlock }
EndStruct

Struct StatsAchievement
  String statString
  { Stat to use for achievement }
  Int statCount
  { how many times required to get the achievement? }
  Int AchievementNumber
  { The achievement to unlock }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
achievements_trackedstatsscript:statsachievement[] Property StatsAchievements Auto Const mandatory
{ All activity based achievements defined via tracked stat events }
achievements_trackedstatsscript:challengeachievement[] Property ChallengeAchievements Auto Const mandatory
{ All activity based achievements defined via Challenge forms }

;-- Functions ---------------------------------------

Function RegisterTrackedStats()
  Int I = 0
  While I < StatsAchievements.Length
    achievements_trackedstatsscript:statsachievement theStatAchievement = StatsAchievements[I]
    Self.RegisterForTrackedStatsEvent(theStatAchievement.statString, theStatAchievement.statCount)
    I += 1
  EndWhile
  Self.RegisterForChallengeEvents()
  Int index = 0
  While index < ChallengeAchievements.Length
    ChallengeAchievements[index].AchievementChallenge.StartPlayerChallenge()
    index += 1
  EndWhile
EndFunction

Event OnTrackedStatsEvent(String asStatFilter, Int aiStatValue)
  Int statsAchievementsIndex = StatsAchievements.findstruct("statString", asStatFilter, 0)
  While statsAchievementsIndex > -1
    achievements_trackedstatsscript:statsachievement theStatAchievement = StatsAchievements[statsAchievementsIndex]
    If theStatAchievement.statCount <= aiStatValue
      Game.AddAchievement(theStatAchievement.AchievementNumber)
    EndIf
    statsAchievementsIndex = StatsAchievements.findstruct("statString", asStatFilter, statsAchievementsIndex + 1)
  EndWhile
EndEvent

Event OnChallengeCompleted(ObjectReference akOwner, challenge akChallenge)
  If akOwner == Game.GetPlayer() as ObjectReference
    Int index = ChallengeAchievements.findstruct("AchievementChallenge", akChallenge, 0)
    If index >= 0
      Game.AddAchievement(ChallengeAchievements[index].AchievementNumber)
    EndIf
  EndIf
EndEvent
