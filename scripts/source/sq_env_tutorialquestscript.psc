ScriptName SQ_Env_TutorialQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct MagicEffectTutorialDatum
  Keyword TutorialEffectKeyword
  { filter for: ENV_TutorialEffect_* }
  String TutorialEvent
EndStruct


;-- Variables ---------------------------------------
Int AfflictionTutorialState
String EventString_CarbondioxideGain = "GainCarbonDioxide"
String EventString_CarbondioxideMaxed = "MaxedCarbonDioxide"
String EventString_EnvDmg = "EnvDmg"
String EventString_EnvDmgReminder = "EnvDmg3"
String EventString_EnvDmgSoak = "EnvDmgSoak"
String EventString_GainInjury = "GainInjury"
String EventString_MatchingTreatment = "MatchingTreatment"
String EventString_Oxygen = "Oxygen"
String EventString_OxygenOut = "OutOfOxygen"
Bool FirstCarbonDioxideTutorialFinished
Bool FirstOxygenTutorialFinished
Float InitialValue_Env_Damage_Soak = 200.0
String MenuName_InventoryMenu = "InventoryMenu" Const
String MenuName_StatusMenu = "StatusMenu" Const
Float TimerDur_EnvDmgHealReminder = 60.0
Float TimerDur_TimerDurMax_EnvDmgHealReminder = 960.0 Const
Int TimerID_EnvDmgHealReminder = 1 Const
Int TreatmentAcquireTutorialState
Int TreatmentTutorialState
defaulttutorialquestscript TutorialIns
Bool TutorialsEnabled = False
Int iTutorialState_Finished = 2
Int iTutorialState_Started = 1
Int iTutorialState_Unset = 0

;-- Properties --------------------------------------
Group Autofill
  sq_env_afflictionsscript Property SQ_Env Auto Const mandatory
  Message Property SQ_ENV_TutorialMsgBox_StatusMenu_Afflictions Auto Const mandatory
  Message Property SQ_ENV_TutorialMsgBox_InventoryMenu_MatchingTreatment Auto Const mandatory
  FormList Property ENV_AFFL_TreatmentTypeKeywords Auto Const mandatory
  ActorValue Property Oxygen Auto Const mandatory
  ActorValue Property CarbonDioxide Auto Const mandatory
  ActorValue Property EnvDmg Auto Const mandatory
  ActorValue Property ENV_Damage_Soak Auto Const mandatory
  Keyword Property ENV_EffectType_AFFL_Affliction Auto Const mandatory
EndGroup

Group EnableTutorials
  Quest Property MQ101 Auto Const mandatory
  Int Property EnableStage = 640 Auto Const
EndGroup

sq_env_tutorialquestscript:magiceffecttutorialdatum[] Property MagicEffectTutorialData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  TutorialIns = (Self as Quest) as defaulttutorialquestscript
  Self.RegisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet")
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == TimerID_EnvDmgHealReminder
    If Game.GetPlayer().GetValue(EnvDmg) > 0.0
      TutorialIns.ShowHelpMessage(EventString_EnvDmgReminder)
      If TimerDur_EnvDmgHealReminder < TimerDur_TimerDurMax_EnvDmgHealReminder
        TimerDur_EnvDmgHealReminder *= 2.0
        Self.StartTimer(TimerDur_EnvDmgHealReminder, TimerID_EnvDmgHealReminder)
      EndIf
    EndIf
  EndIf
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If akSender == MQ101 && auiStageID == EnableStage
    Self.EnableTutorials()
    Self.UnregisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet")
  EndIf
EndEvent

Function EnableTutorials()
  TutorialsEnabled = True
  Self.StartOxygenTutorial()
  Self.StartEnvDmgTutorial()
  If SQ_Env.GetActiveAfflictions(False, False, False, False, None).Length > 0
    Self.StartAfflictionTutorial()
  EndIf
  Actor playerRef = Game.GetPlayer()
  Int I = 0
  While I < MagicEffectTutorialData.Length
    sq_env_tutorialquestscript:magiceffecttutorialdatum currentDatum = MagicEffectTutorialData[I]
    If playerRef.HasMagicEffectWithKeyword(currentDatum.TutorialEffectKeyword)
      String tutorialEventString = currentDatum.TutorialEvent
      ((Self as Quest) as defaulttutorialquestscript).ShowHelpMessage(tutorialEventString)
    EndIf
    I += 1
  EndWhile
  If playerRef.HasMagicEffectWithKeyword(ENV_EffectType_AFFL_Affliction)
    Self.StartAfflictionTutorial()
  EndIf
EndFunction

Function StartAfflictionTutorial()
  If TutorialsEnabled == False
    Return 
  EndIf
  If AfflictionTutorialState == iTutorialState_Unset
    AfflictionTutorialState = iTutorialState_Started
    TreatmentTutorialState = iTutorialState_Started
    TreatmentAcquireTutorialState = iTutorialState_Started
    TutorialIns.ShowHelpMessage(EventString_GainInjury)
    Self.RegisterForMenuOpenCloseEvent(MenuName_StatusMenu)
    Self.RegisterForMenuOpenCloseEvent(MenuName_InventoryMenu)
    Self.AddInventoryEventFilter(ENV_AFFL_TreatmentTypeKeywords as Form)
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded")
  EndIf
EndFunction

Function StartOxygenTutorial()
  Actor playerRef = Game.GetPlayer()
  Self.RegisterForActorValueLessThanEvent(playerRef as ObjectReference, Oxygen, 85.0)
  Self.RegisterForActorValueGreaterThanEvent(playerRef as ObjectReference, CarbonDioxide, 25.0)
EndFunction

Function StartEnvDmgTutorial()
  Actor playerRef = Game.GetPlayer()
  Self.RegisterForActorValueLessThanEvent(playerRef as ObjectReference, ENV_Damage_Soak, InitialValue_Env_Damage_Soak - 1.0)
EndFunction

Function ShowEffectScriptHelpMessage(Keyword TutorialEffectKeyword)
  If TutorialsEnabled
    Int foundIndex = MagicEffectTutorialData.findstruct("TutorialEffectKeyword", TutorialEffectKeyword, 0)
    If foundIndex > -1
      String tutorialEventString = MagicEffectTutorialData[foundIndex].TutorialEvent
      ((Self as Quest) as defaulttutorialquestscript).ShowHelpMessage(tutorialEventString)
    EndIf
  EndIf
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Oxygen
    If FirstOxygenTutorialFinished == False
      TutorialIns.ShowHelpMessage(EventString_Oxygen)
      FirstOxygenTutorialFinished = True
      Self.RegisterForActorValueLessThanEvent(Game.GetPlayer() as ObjectReference, Oxygen, 20.0)
    Else
      TutorialIns.UnshowHelpMessage(EventString_Oxygen)
      TutorialIns.ShowHelpMessage(EventString_OxygenOut)
    EndIf
  ElseIf akActorValue == ENV_Damage_Soak
    TutorialIns.ShowHelpMessage(EventString_EnvDmgSoak)
    Utility.Wait(10.0)
    Self.RegisterForActorValueGreaterThanEvent(Game.GetPlayer() as ObjectReference, EnvDmg, 1.0)
  EndIf
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == CarbonDioxide
    If FirstCarbonDioxideTutorialFinished == False
      TutorialIns.UnshowHelpMessage(EventString_OxygenOut)
      TutorialIns.ShowHelpMessage(EventString_CarbondioxideGain)
      FirstCarbonDioxideTutorialFinished = True
      Self.RegisterForActorValueGreaterThanEvent(Game.GetPlayer() as ObjectReference, CarbonDioxide, 99.0)
    Else
      TutorialIns.UnshowHelpMessage(EventString_CarbondioxideGain)
      TutorialIns.ShowHelpMessage(EventString_CarbondioxideMaxed)
    EndIf
  ElseIf akActorValue == EnvDmg
    TutorialIns.UnshowHelpMessage(EventString_EnvDmgSoak)
    TutorialIns.ShowHelpMessage(EventString_EnvDmg)
    Self.StartTimer(TimerDur_EnvDmgHealReminder, TimerID_EnvDmgHealReminder)
  EndIf
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If abOpening
    If asMenuName == MenuName_StatusMenu && AfflictionTutorialState == iTutorialState_Started
      TutorialIns.UnshowHelpMessage(EventString_GainInjury)
      SQ_ENV_TutorialMsgBox_StatusMenu_Afflictions.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnregisterForMenuOpenCloseEvent(MenuName_StatusMenu)
      AfflictionTutorialState = iTutorialState_Finished
    ElseIf asMenuName == MenuName_InventoryMenu && TreatmentTutorialState == iTutorialState_Started
      Bool hasMatchingAfflictionTreatment = SQ_Env.PlayerHasMatchingTreatmentItemForAnActiveAffliction()
      If hasMatchingAfflictionTreatment
        TutorialIns.UnshowHelpMessage(EventString_MatchingTreatment)
        SQ_ENV_TutorialMsgBox_InventoryMenu_MatchingTreatment.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        TreatmentTutorialState = iTutorialState_Finished
        TreatmentAcquireTutorialState = iTutorialState_Finished
        Self.UnregisterForMenuOpenCloseEvent(MenuName_InventoryMenu)
      EndIf
    EndIf
  EndIf
EndEvent

Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If TreatmentAcquireTutorialState == iTutorialState_Started
    Bool hasMatchingAfflictionTreatment = SQ_Env.FormHasMatchingTreatmentItemForAnActiveAffliction(akBaseItem)
    If hasMatchingAfflictionTreatment
      TutorialIns.ShowHelpMessage("MatchingTreatment")
      TreatmentAcquireTutorialState = iTutorialState_Finished
    EndIf
  EndIf
  If TreatmentAcquireTutorialState == iTutorialState_Finished
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded")
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
