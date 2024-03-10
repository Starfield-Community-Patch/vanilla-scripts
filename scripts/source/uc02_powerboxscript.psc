ScriptName UC02_PowerBoxScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property LinkedDefenses Auto Const mandatory
{ The defenses you want to turn on when the power is thrown }
Keyword Property TopicToPlay Auto Const mandatory
{ Topic to play when all the power boxes are activated }
Keyword Property AdditionalBreakerTopic Auto Const mandatory
{ Topic to play if there are additional breakers to throw still }
Keyword Property UC02_SystemOffline_Keyword Auto Const mandatory
{ Keyword to trigger topic if the player gets here early }
Quest Property UC02 Auto Const mandatory
{ UC02 quest }
Int Property PreReqStage = 601 Auto Const
{ If the player attempts to activate these objects before this stage is set, they'll fail }
ReferenceAlias Property DefenseSystem Auto Const mandatory
{ Actor alias for the defense system }
ReferenceAlias Property LightAlias Auto Const mandatory
{ Alias for the enable marker that manages each group of lights }
wwiseevent Property QST_UC02_Turret_Power_Half Auto Const mandatory
{ Sound to play if the player's partially restored power to the system }
wwiseevent Property QST_UC02_Turret_Power_Full Auto Const mandatory
{ Sound to play if the player's fully restored power to the system }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If UC02.GetStageDone(PreReqStage)
    Self.RemoveRef(akSenderRef)
    If Self.GetCount() <= 0
      Int I = 0
      Int iCount = LinkedDefenses.GetCount()
      Bool bAnyAlive = False
      While I < iCount
        Actor currAct = LinkedDefenses.GetAt(I) as Actor
        If currAct.IsUnconscious() && !currAct.IsDead()
          bAnyAlive = True
          LightAlias.GetRef().Enable(False)
          currAct.SetUnconscious(False)
          currAct.IgnoreFriendlyHits(True)
        EndIf
        I += 1
      EndWhile
      If bAnyAlive
        QST_UC02_Turret_Power_Full.Play(Game.GetPlayer() as ObjectReference, None, None)
        akSenderRef.SayCustom(TopicToPlay, DefenseSystem.GetActorRef(), False, None)
      EndIf
    Else
      QST_UC02_Turret_Power_Half.Play(Game.GetPlayer() as ObjectReference, None, None)
      akSenderRef.SayCustom(AdditionalBreakerTopic, DefenseSystem.GetActorRef(), False, None)
    EndIf
  Else
    akSenderRef.SayCustom(UC02_SystemOffline_Keyword, DefenseSystem.GetActorRef(), False, None)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
