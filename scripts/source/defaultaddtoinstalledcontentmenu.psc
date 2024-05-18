ScriptName DefaultAddToInstalledContentMenu Extends Quest
{ A default script to add messages to the in-game Installed Content Menu. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TheMessage Auto
{ The message to add to the Installed Content Menu. }
FormList Property HelpManualInstalledContent Auto
{ Auto-Fill }

;-- Functions ---------------------------------------

Event OnInit()
  If HelpManualInstalledContent.Find(TheMessage as Form) < 0
    HelpManualInstalledContent.AddForm(TheMessage as Form)
  EndIf
EndEvent
