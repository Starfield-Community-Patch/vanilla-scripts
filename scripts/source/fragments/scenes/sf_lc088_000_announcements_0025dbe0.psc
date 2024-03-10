ScriptName Fragments:Scenes:SF_LC088_000_Announcements_0025DBE0 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property LC088_Vigilance_PlayAnnouncementValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 0.0)
EndFunction
