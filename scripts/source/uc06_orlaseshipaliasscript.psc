ScriptName UC06_OrlaseShipAliasScript Extends ReferenceAlias

;-- Structs -----------------------------------------
Struct HealthDatum
  Int PlayerLevel
  ActorValue TargetValue
  Float UpdatedHealthValue
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC06_OnHitDebugEnabled Auto Const mandatory
{ If this is "1", this script will continually register for hit events, which is a complete waste of processing power }
Int Property PreReqStage = 300 Auto Const
{ If this stage is set and Orlase loads in, update his health }
Int Property ShutdownStage = 550 Auto Const
{ If this stage is set, the Orlase sequence is done, so we don't need to worry about this anymore }
Int Property StageToSet = 301 Auto Const
{ Player triggered the health increase. Set this stage to ensure it doesn't happen again }
uc06_orlaseshipaliasscript:healthdatum[] Property HealthData Auto Const mandatory
{ The list of health number we should set Orlase's ship to. This is based off the numbers for the LShip_CrimsonFleet_Combat_C }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If UC06_OnHitDebugEnabled.GetValue() >= 1.0
    Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event OnLoad()
  Quest OQ = Self.GetOwningQuest()
  If !OQ.GetStageDone(StageToSet) && OQ.GetStageDone(PreReqStage) && !OQ.GetStageDone(ShutdownStage)
    OQ.SetStage(StageToSet)
    uc06_orlaseshipaliasscript:healthdatum TargetDatum = Self.UpdateShipHealth()
    spaceshipreference myShip = Self.GetShipRef()
    myShip.SetValue(TargetDatum.TargetValue, TargetDatum.UpdatedHealthValue)
  EndIf
EndEvent

uc06_orlaseshipaliasscript:healthdatum Function UpdateShipHealth()
  Int iPlayerLevel = Game.GetPlayer().GetLevel()
  Int I = 0
  Int iLength = HealthData.Length
  uc06_orlaseshipaliasscript:healthdatum TargetDatum = None
  While I < iLength
    Int iTargetLevel = HealthData[I].PlayerLevel
    TargetDatum = HealthData[I]
    If iTargetLevel >= iPlayerLevel
      Return TargetDatum
    EndIf
    I += 1
  EndWhile
  Return TargetDatum
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
