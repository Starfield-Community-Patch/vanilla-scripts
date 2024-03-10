ScriptName BE_DerelictScript Extends Quest
{ Script to handle additional derelict functions }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MusicProperties collapsedonbase
  MusicType[] Property MusicTrack Auto Const
  { The array of music tracks. }
  Int Property TrackNumber Auto
  { The music track number in the array we will play. }
  Bool Property RandomTrack = False Auto
  { Default=false. Do we want to play a random track each time the player enters the cell? }
EndGroup

ReferenceAlias Property ModuleCockpit Auto Const mandatory
{ The module cockpit. }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference enemyShipCockpit = ModuleCockpit.GetRef()
  Self.RegisterForRemoteEvent(enemyShipCockpit as ScriptObject, "OnCellAttach")
  Self.RegisterForRemoteEvent(enemyShipCockpit as ScriptObject, "OnCellDetach")
EndEvent

Event ObjectReference.OnCellAttach(ObjectReference akSource)
  If RandomTrack == True
    TrackNumber = Utility.RandomInt(0, MusicTrack.Length)
  EndIf
  Self.PlayMusic(MusicTrack[TrackNumber], True)
EndEvent

Event ObjectReference.OnCellDetach(ObjectReference akSource)
  Self.PlayMusic(MusicTrack[TrackNumber], False)
EndEvent

Function PlayMusic(MusicType MusicTrack, Bool abPlay)
  If abPlay == True
    MusicTrack[TrackNumber].Add()
  Else
    MusicTrack[TrackNumber].Remove()
  EndIf
EndFunction
