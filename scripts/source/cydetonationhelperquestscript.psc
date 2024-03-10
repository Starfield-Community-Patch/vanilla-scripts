ScriptName CYDetonationHelperQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CY_DetonationCount Auto Const mandatory
GlobalVariable Property CY_DetonationStartOfDay Auto Const mandatory
GlobalVariable Property CY_DetonationEndOfDay Auto Const mandatory
GlobalVariable Property CY_AnnouncementStartOfDay Auto Const mandatory
GlobalVariable Property CY_AnnouncementEndOfDay Auto Const mandatory
Quest Property DialogueCydonia_Detonation Auto Const mandatory
Quest Property DialogueCydonia_Announcement Auto Const mandatory
Quest Property DialogueCydonia Auto Const mandatory
Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const mandatory
Keyword Property DialogueCydoniaAnnouncementQuestStartKeyword Auto Const mandatory
LocationAlias Property Cydonia Auto Const mandatory
Int Property DetonationTimerID = 0 Auto Const
Float Property DetonationMinTimerLength = 300.0 Auto Const
Float Property DetonationMaxTimerLength = 900.0 Auto Const
Int Property AnnouncementTimerID = 1 Auto Const
Float Property AnnouncementMinTimerLength = 120.0 Auto Const
Float Property AnnouncementMaxTimerLength = 300.0 Auto Const
Int Property EstablishingSceneDoneStage = 15 Auto Const

;-- Functions ---------------------------------------

Function StartDetonationTimer()
  Float fTimer = Utility.RandomFloat(DetonationMinTimerLength, DetonationMaxTimerLength)
  Self.StartTimer(fTimer, DetonationTimerID)
EndFunction

Function StartAnnouncementTimer()
  Float fTimer = Utility.RandomFloat(AnnouncementMinTimerLength, AnnouncementMaxTimerLength)
  Self.StartTimer(fTimer, AnnouncementTimerID)
EndFunction

Function StartDetonationSequence()
  If DialogueCydonia_Announcement.IsRunning()
    Float fTimer = Utility.RandomFloat(60.0, 120.0)
    Self.StartTimer(fTimer, DetonationTimerID)
  Else
    If CY_DetonationCount.GetValue() >= 1.0 && !DialogueCydonia_Detonation.IsRunning()
      If Game.GetLocalTime() >= CY_DetonationStartOfDay.GetValue() && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue()
        If Game.GetPlayer().IsInLocation(Cydonia.GetLocation())
          DialogueCydoniaDetonationQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
        EndIf
      EndIf
    EndIf
    Self.StartDetonationTimer()
  EndIf
EndFunction

Function StartAnnouncementSequence()
  If DialogueCydonia_Detonation.IsRunning()
    Float fTimer = Utility.RandomFloat(60.0, 120.0)
    Self.StartTimer(fTimer, AnnouncementTimerID)
  Else
    If !DialogueCydonia_Announcement.IsRunning()
      If Game.GetLocalTime() >= CY_AnnouncementStartOfDay.GetValue() && Game.GetLocalTime() <= CY_AnnouncementEndOfDay.GetValue()
        Actor myPlayer = Game.GetPlayer()
        If myPlayer.IsInLocation(Cydonia.GetLocation()) && myPlayer.IsInInterior()
          DialogueCydoniaAnnouncementQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
        EndIf
      EndIf
    EndIf
    Self.StartAnnouncementTimer()
  EndIf
EndFunction

Event OnQuestInit()
  Self.StartDetonationTimer()
  Self.StartAnnouncementTimer()
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == DetonationTimerID
    Self.StartDetonationSequence()
  ElseIf aiTimerID == AnnouncementTimerID
    If DialogueCydonia.GetStageDone(EstablishingSceneDoneStage)
      Self.StartAnnouncementSequence()
    Else
      Float fTimer = Utility.RandomFloat(60.0, 120.0)
      Self.StartTimer(fTimer, AnnouncementTimerID)
    EndIf
  EndIf
EndEvent
