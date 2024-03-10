ScriptName UC05_QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct IntercomDatum
  ReferenceAlias TargetIntercom
  { The currently active intercom }
  ReferenceAlias MatchingPowerSwitch
  { What power box this intercom is leading the player to. If it's already been thrown, we'll progress 
    to the next batch }
  Bool WaitForRestart
  { If true, don't update to the next intercom until the relevant power swtich is thrown }
  Int StageToSetOnActive = -1
  { When this intercom is the active one, and is activated, set this stage }
EndStruct


;-- Variables ---------------------------------------
Bool SkipRemoval
Bool SkipUpdates

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard IntercomStateGuard

;-- Properties --------------------------------------
Group Objects
  ReferenceAlias Property ActiveIntercom Auto Const mandatory
  { Alias to hold the currently active intercom }
  ReferenceAlias Property ActiveIntercomTrigger Auto Const mandatory
  { Alias to hold the currently active intercom trigger. When the player enters this, we update to the next intercom }
  ReferenceAlias Property IntercomAudioSource Auto Const mandatory
  { The object making the intercom audio sounds }
  ReferenceAlias Property IntercomSoundMarker Auto Const mandatory
  { Ref alias for the sound marker that we move around to create the persistent hissing }
  Scene Property UC05_Codin_LoopingIntercom Auto Const mandatory
  { Looping audio scene to draw the player towards the next marker }
  RefCollectionAlias Property Alias_VenomTreeHaze_Group01 Auto Const mandatory
  { Venom Tree Haze on the first floor tied to power switch in the meeting room }
  RefCollectionAlias Property Alias_VenomTreeHaze_Group02 Auto Const mandatory
  { Venom Tree Haze on the third floor tied to power switch in the room near the cubicles }
  RefCollectionAlias Property Shutters Auto Const mandatory
  { Ref collection for the shutters in the Cabinet chambers }
EndGroup

Group IntercomData
  uc05_questscript:intercomdatum[] Property IntercomData Auto mandatory
  { An array of ref alias pairings that manage the order on the intercoms through which the player has to run in the 
    Va'ruun embassy }
  uc05_questscript:intercomdatum[] Property IntercomDataStorage Auto mandatory
  { An array of ref aliases allowing me to store old data without throwing it all out. Not used for anything else. }
  Int Property IntercomState Auto conditional
  { A var that gets updated each time we've throw one of the power switches to allow the Ambassador's audio to get clearer }
EndGroup

Group Stages
  Int[] Property PowerSwitchStages Auto Const mandatory
  { Array of stages to check when a power switch is throw. If they're all set, set stage 600 }
  Int Property AllPowerOnStage = 600 Auto Const
  { Stage to set once all the power's back on }
  Int Property ShutdownStage = 650 Auto Const
  { Once this stage has been set, no additonal activations should do anything }
EndGroup


;-- Functions ---------------------------------------

Function UpdateActiveIntercom(ScriptObject akSourceCall, Bool bRestartChain, ReferenceAlias PowerSwitchAlias, Int PrereqStage)
  If !Self.GetStageDone(ShutdownStage)
    uc05_questscript:intercomdatum currDatum = IntercomData[0]
    ObjectReference currIntercom = currDatum.TargetIntercom.GetRef()
    ObjectReference currActiveIntercom = ActiveIntercom.GetRef()
    If PowerSwitchAlias != None
      ObjectReference ActivatedPowerbox = PowerSwitchAlias.GetRef()
      ObjectReference currDatumPowerSwitch = currDatum.MatchingPowerSwitch.GetRef()
      Self.CleanUpIntercomList(PowerSwitchAlias)
      Self.CheckForAllSwitchesSet()
      If ActivatedPowerbox != currDatumPowerSwitch || PrereqStage > 0 && !Self.GetStageDone(PrereqStage)
        Return 
      EndIf
    EndIf
    If currActiveIntercom != None
      UC05_Codin_LoopingIntercom.Stop()
    EndIf
    ActiveIntercom.Clear()
    ObjectReference SoundREF = IntercomSoundMarker.GetRef()
    SoundREF.Disable(False)
    If bRestartChain
      currDatum = IntercomData[0]
      currIntercom = currDatum.TargetIntercom.GetRef()
      SkipUpdates = False
    EndIf
    If !SkipUpdates
      Int currStage = currDatum.StageToSetOnActive
      If currStage >= 0
        (ActiveIntercom as uc05_activeintercomaliasscript).UpdateStageToSet(currStage)
      EndIf
      ActiveIntercom.ForceRefTo(currIntercom)
      ObjectReference SceneREF = IntercomAudioSource.GetRef()
      SceneREF.MoveTo(currIntercom, 0.0, 0.0, 0.0, True, False)
      SoundREF.MoveTo(currIntercom, 0.0, 0.0, 0.0, True, False)
      SoundREF.Enable(False)
      UC05_Codin_LoopingIntercom.Start()
      If !SkipRemoval
        IntercomData.remove(0, 1)
      Else
        SkipRemoval = False
      EndIf
    EndIf
    If currDatum.WaitForRestart
      SkipUpdates = True
      SkipRemoval = True
    EndIf
  EndIf
EndFunction

Function CleanUpIntercomList(ReferenceAlias akActivatedPowerSwitch)
  Int I = IntercomData.Length - 1
  While I >= 0
    uc05_questscript:intercomdatum currDatum = IntercomData[I]
    ReferenceAlias currPowerSwitchAlias = currDatum.MatchingPowerSwitch
    ObjectReference IntercomREF = currDatum.TargetIntercom.GetRef()
    If currPowerSwitchAlias == akActivatedPowerSwitch
      IntercomData.remove(I, 1)
    EndIf
    I -= 1
  EndWhile
EndFunction

Function DEBUGPrintIntercomArray()
  Int I = 0
  Int iLength = IntercomData.Length
  While I < iLength
    I += 1
  EndWhile
EndFunction

Function CheckForAllSwitchesSet()
  Int I = 0
  Int iLength = PowerSwitchStages.Length
  Bool bPowerSwitchesRemain = False
  While I < iLength && !bPowerSwitchesRemain
    Int currStage = PowerSwitchStages[I]
    If !Self.GetStageDone(currStage)
      bPowerSwitchesRemain = True
    EndIf
    I += 1
  EndWhile
  If !bPowerSwitchesRemain
    Self.SetStage(AllPowerOnStage)
  EndIf
EndFunction

Function IncrementIntercomState(Int aiIncrementAmount)
  Guard IntercomStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    IntercomState += aiIncrementAmount
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function RemoveHaze(Int abSwitch)
  Int I = 0
  If abSwitch == 1
    ObjectReference[] VenomHazeGroupRef = Alias_VenomTreeHaze_Group01.GetArray()
    While I < VenomHazeGroupRef.Length
      VenomHazeGroupRef[I].PlayAnimation("stage2")
      I += 1
    EndWhile
  ElseIf abSwitch == 2
    ObjectReference[] venomhazegroupref = Alias_VenomTreeHaze_Group02.GetArray()
    While I < venomhazegroupref.Length
      venomhazegroupref[I].PlayAnimation("stage2")
      I += 1
    EndWhile
  EndIf
EndFunction

Function OpenShutters()
  Int I = 0
  Int iCount = Shutters.GetCount()
  While I < iCount
    ObjectReference currRef = Shutters.GetAt(I)
    currRef.PlayAnimation("Open")
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
