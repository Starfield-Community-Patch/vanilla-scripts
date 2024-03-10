ScriptName UC04_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bMusicActive

;-- Properties --------------------------------------
Location Property CityNewAtlantisLocation Auto Const mandatory
{ New Atlantis location }
Int Property PrereqStage = 425 Auto Const
{ Once this stage is set, turn on the combat music }
Int Property ShutdownStage = 850 Auto Const
{ Once this stage is set, we can stop checking this }
Int Property FailsafeStage = 910 Auto Const
{ In case the music didn't get turned off earlier, try it again at this stage }
MusicType Property MUSGenesisCombat_UC04 Auto Const mandatory
{ Music type object for the UC attakc music }
conditionform Property UC04_WeaponIsTypeEM Auto Const mandatory
{ Condition for to check to see if the player's equipped an EM weapon }
Int Property EMSectionStageToSet = 581 Auto Const
{ Player equipped an EM weapon during the NAT sequence. Update their objectives if they're still valid }
Int Property EMSectionPrereqStage = 600 Auto Const
{ Only start checking the player's equip events if this stage has been set }
Int Property EMSectionShutdownStage = 590 Auto Const
{ Once this stage is set, stop checking for the player equipping the EM weapon during the NAT sequence }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage
    Self.ToggleCombatMusic(True)
  ElseIf auiStageID == ShutdownStage
    Self.ToggleCombatMusic(False)
  ElseIf auiStageID == FailsafeStage
    Self.ToggleCombatMusic(False)
  EndIf
EndEvent

Function ToggleCombatMusic(Bool bMusicOn)
  If bMusicOn
    If !bMusicActive
      bMusicActive = True
      MUSGenesisCombat_UC04.Add()
    EndIf
  ElseIf !bMusicOn
    If bMusicActive
      bMusicActive = False
      MUSGenesisCombat_UC04.Remove()
    EndIf
  EndIf
EndFunction

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  Quest OQ = Self.GetOwningQuest()
  If UC04_WeaponIsTypeEM.IsTrue(None, None) && OQ.GetStageDone(EMSectionPrereqStage) && !OQ.GetStageDone(EMSectionShutdownStage) && !OQ.GetStageDone(EMSectionStageToSet)
    OQ.SetStage(EMSectionStageToSet)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
