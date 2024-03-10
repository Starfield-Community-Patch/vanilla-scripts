ScriptName SQ_EarthquakeOnLoadScript Extends ObjectReference
{ does an "earthquake" effect on load, and disables itself }

;-- Variables ---------------------------------------
Int earthquakeTimerID = 1 Const
Int numQuakes = 0
Int numRevealCave = 0
Int numStaggers = 0
ObjectReference rockfallFXRef
Int rockfallFXTimerID = 2 Const
Float staggerTime = 0.0
Int staggerTimerID = 3 Const

;-- Properties --------------------------------------
Group CaveRevealData
  Bool Property HasCaveReveal = True Auto Const
  { set to true if there's a cave to reveal (FX will play)
      set to false if this should only play earthquake FX }
  Explosion Property RockfallExplosion Auto Const mandatory
  { rockfall explosion }
  movablestatic Property RockfallFX Auto Const mandatory
  { place some FX at me for a bit }
  Float Property RockfallFXTime = 10.0 Auto Const
  { how long to leave RockfallFX enabled? }
EndGroup

Float Property EarthquakePercentChance = 50.0 Auto Const
{ percent chance the earthquake is triggered onLoad }
Float Property timeBetweenQuakesMin = 5.0 Auto Const
Float Property timeBetweenQuakesMax = 15.0 Auto Const
Float Property earthquakeDurationMin = 2.5 Auto Const
Float Property earthquakeDurationMax = 7.0 Auto Const
Float Property earthquakeStaggerMinTime = 3.0 Auto Const
{ min amount of time between casting the stagger spell }
Int Property minQuakes = 2 Auto Const
Int Property maxQuakes = 5 Auto Const
wwiseevent Property OE_EarthquakeSound Auto Const mandatory
{ sound the earthquake makes }
wwiseevent Property WwiseEvent_ShakeController_p5_p5_05 Auto Const mandatory
{ controller shake }
wwiseevent Property WwiseEvent_ShakeController_p25_p25_03 Auto Const mandatory
{ controller shake }
Spell Property SQ_EarthquakeStagger Auto Const mandatory
{ spell to stagger actors in loaded area }
Keyword[] Property EarthquakeTraits Auto Const
{ array of planet traits that allow earthquakes - if this is on a planet without earthquakes, immediately do the cave reveal (if any) and shut down }
String Property jumpAnimVariableName = "iSyncJumpState" Auto Const
{ used to check player's jump state }
Keyword Property PCM_Request_BlockCreation Auto Const mandatory
{ used to check if being placed by quest/scan request }

;-- Functions ---------------------------------------

Function Earthquake()
  Float duration = Utility.RandomFloat(earthquakeDurationMin, earthquakeDurationMax)
  Game.ShakeCamera(None, 0.25, duration)
  If duration < 5.0
    WwiseEvent_ShakeController_p25_p25_03.Play(Game.GetPlayer() as ObjectReference, None, None)
  Else
    WwiseEvent_ShakeController_p5_p5_05.Play(Game.GetPlayer() as ObjectReference, None, None)
  EndIf
  Actor playerRef = Game.GetPlayer()
  OE_EarthquakeSound.Play(playerRef as ObjectReference, None, None)
  Bool isJumping = playerRef.GetAnimationVariableBool(jumpAnimVariableName)
  If isJumping == False
    SQ_EarthquakeStagger.Cast(Self as ObjectReference, playerRef as ObjectReference)
  EndIf
  If duration > earthquakeStaggerMinTime
    staggerTime = Utility.RandomFloat(earthquakeStaggerMinTime, duration)
    numStaggers = Math.Floor(duration / staggerTime)
  EndIf
  If HasCaveReveal && numQuakes <= numRevealCave && Self.IsDisabled() == False
    Utility.wait(1.0)
    Self.Disable(False)
    Self.StartTimer(RockfallFXTime, rockfallFXTimerID)
  EndIf
  numQuakes -= 1
  If numQuakes > 0
    Float timeToNextQuake = Utility.RandomFloat(timeBetweenQuakesMin, timeBetweenQuakesMax)
    Self.StartTimer(timeToNextQuake, earthquakeTimerID)
  Else
    Self.GotoState("Done")
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == earthquakeTimerID
    Self.Earthquake()
  ElseIf aiTimerID == rockfallFXTimerID
    If rockfallFXRef
      rockfallFXRef.Disable(False)
      rockfallFXRef = None
    EndIf
  ElseIf aiTimerID == staggerTimerID
    numStaggers -= 1
    SQ_EarthquakeStagger.Cast(Self as ObjectReference, Game.GetPlayer() as ObjectReference)
    If numStaggers > 0
      Self.StartTimer(staggerTime, staggerTimerID)
    EndIf
  EndIf
EndEvent

Event OnUnload()
  Self.CancelTimer(earthquakeTimerID)
  Self.CancelTimer(rockfallFXTimerID)
  Self.CancelTimer(staggerTimerID)
EndEvent

;-- State -------------------------------------------
State Done

  Event OnBeginState(String asOldState)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
State Earthquake

  Event OnBeginState(String asOldState)
    numQuakes = Utility.RandomInt(minQuakes, maxQuakes)
    numRevealCave = Utility.RandomInt(1, numQuakes)
    Float timeToNextQuake = Utility.RandomFloat(timeBetweenQuakesMin, timeBetweenQuakesMax)
    Self.StartTimer(timeToNextQuake, earthquakeTimerID)
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    If Self.IsDisabled() == False
      If HasCaveReveal || Game.GetDieRollSuccess(EarthquakePercentChance as Int, 1, 100, -1, -1)
        Self.GotoState("Earthquake")
      EndIf
    EndIf
  EndEvent

  Event OnInit()
    planet myPlanet = Self.GetCurrentPlanet()
    If myPlanet
      Int I = 0
      Bool traitFound = False
      Location myLocation = Self.GetCurrentLocation()
      If myLocation == None || myLocation.HasKeyword(PCM_Request_BlockCreation)
        While I < EarthquakeTraits.Length && traitFound == False
          traitFound = myPlanet.HasKeyword(EarthquakeTraits[I])
          I += 1
        EndWhile
      EndIf
      If traitFound == False
        Self.GotoState("Done")
      ElseIf HasCaveReveal == False || Game.GetDieRollSuccess(EarthquakePercentChance as Int, 1, 100, -1, -1)
        Self.EnableNoWait(False)
      Else
        Self.GotoState("Done")
      EndIf
    EndIf
  EndEvent
EndState
