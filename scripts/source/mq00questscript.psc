ScriptName MQ00QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct VisionStruct
  wwiseevent VisionWWiseEvent
  String VisionBink
EndStruct


;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ArmillaryPlacedOrRemovedGuardWorkshop

;-- Properties --------------------------------------
Quest Property MQ204 Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
Int Property MQ204_PlayerSecuresArmillaryStage = 620 Auto Const
Int Property MQ204_PlayerSecuresArmillaryPrereqStage = 510 Auto Const
Int Property MQ404_PlayerSecuresArmillaryStage = 120 Auto Const
Int Property MQ404_PlayerSecuresArmillaryPrereqStage = 110 Auto Const
ReferenceAlias Property MQ00_Armillary Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryWorkshop Auto Const mandatory
ActorValue Property MQ_ArmillaryResourceAV Auto Const mandatory
Int Property ArmillaryTimerID = 20 Auto Const
GlobalVariable Property MQArmillaryLocation Auto Const mandatory
GlobalVariable Property ArtifactVisionNumber Auto Const mandatory
Int Property MQ104ATimerID = 30 Auto Const
Int Property MQ104BTimerID = 40 Auto Const
Int Property MQ201TimerID = 50 Auto Const
Int Property MQ207BTimerID = 60 Auto Const
Quest Property MQ102 Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Quest Property MQ106 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
Quest Property MQ207 Auto Const mandatory
Quest Property MQ207B Auto Const mandatory
Float Property QuestCheckTimerLength = 3.0 Auto Const
mq00questscript:visionstruct[] Property VisionArray Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTimer(Int aiTimerID)
  If aiTimerID == ArmillaryTimerID
    ObjectReference ArmillaryWorkshopREF = MQ00_ArmillaryWorkshop.GetRef()
    ObjectReference[] ArmillaryObjects = ArmillaryWorkshopREF.GetWorkshopResourceObjects(MQ_ArmillaryResourceAV, 0)
    Self.ArmillaryPlacedOrRemoved(ArmillaryObjects[0], ArmillaryWorkshopREF)
  EndIf
  If aiTimerID == MQ104ATimerID
    Self.MQ00QuestFailsafe(MQ104A, MQ104ATimerID)
  EndIf
  If aiTimerID == MQ104BTimerID
    Self.MQ00QuestFailsafe(MQ104B, MQ104BTimerID)
  EndIf
  If aiTimerID == MQ201TimerID
    Self.MQ00QuestFailsafe(MQ201, MQ201TimerID)
  EndIf
  If aiTimerID == MQ207BTimerID
    Self.MQ00QuestFailsafe(MQ207B, MQ207BTimerID)
  EndIf
EndEvent

Function MQ00QuestFailsafe(Quest QuestToStart, Int iQuestTimer)
  If QuestToStart.IsCompleted() == False && QuestToStart.IsRunning() == False
    QuestToStart.RemoveRequestedPCMQuestLocations()
    Bool bQuestHasStarted = QuestToStart.Start()
    If bQuestHasStarted == False
      Self.StartTimer(QuestCheckTimerLength, iQuestTimer)
    Else
      QuestToStart.SetStage(10)
    EndIf
  EndIf
EndFunction

Function StartArmillaryTimer(ObjectReference akReference)
  MQ00_ArmillaryWorkshop.ForceRefTo(akReference)
  Self.StartTimer(0.5, ArmillaryTimerID)
EndFunction

Function StartMQ104AFailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ104ATimerID)
EndFunction

Function StartMQ104BFailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ104BTimerID)
EndFunction

Function StartMQ201FailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ201TimerID)
EndFunction

Function StartMQ207BFailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ207BTimerID)
EndFunction

Function ArmillaryPlacedOrRemoved(ObjectReference akReference, ObjectReference akWorkshopRef)
  Guard ArmillaryPlacedOrRemovedGuardWorkshop ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If akWorkshopRef.GetValue(MQ_ArmillaryResourceAV) == 0.0
      Self.ArmillaryRemoved()
    Else
      Self.ArmillaryPlaced(akReference.GetLinkedRef(None), akReference)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ArmillaryRemoved()
  spaceshipreference ArmillaryShipREF = MQ00_Armillary.GetRef().GetCurrentShipRef()
  Self.UnRegisterForRemoteEvent(ArmillaryShipREF as ScriptObject, "OnShipSold")
  Self.UnRegisterForRemoteEvent(ArmillaryShipREF as ScriptObject, "OnDeath")
  MQ00_ArmillaryMountOrScreen.GetRef().PlayAnimation("Play02")
  MQ00_Armillary.Clear()
  MQ00_ArmillaryMountOrScreen.Clear()
  If MQ305.IsRunning()
    (MQ305 as mq305script).ArmillaryRemoved()
  EndIf
  MQArmillaryLocation.SetValueInt(0)
EndFunction

Function ArmillaryPlaced(ObjectReference akArmillary, ObjectReference akMountOrScreen)
  MQ00_Armillary.ForceRefTo(akArmillary)
  MQ00_ArmillaryMountOrScreen.ForceRefTo(akMountOrScreen)
  If akMountOrScreen.GetCurrentShipRef() != None
    MQArmillaryLocation.SetValueInt(1)
  Else
    MQArmillaryLocation.SetValueInt(2)
  EndIf
  If MQ204.IsRunning() && MQ204.GetStageDone(MQ204_PlayerSecuresArmillaryStage) == False && MQ204.GetStageDone(MQ204_PlayerSecuresArmillaryPrereqStage) == True
    MQ204.SetStage(MQ204_PlayerSecuresArmillaryStage)
  EndIf
  If MQ404.IsRunning() && MQ404.GetStageDone(MQ204_PlayerSecuresArmillaryStage) == False && MQ404.GetStageDone(MQ404_PlayerSecuresArmillaryPrereqStage) == True
    MQ404.SetStage(MQ404_PlayerSecuresArmillaryStage)
  EndIf
EndFunction

Function PlayArtifactVision()
  Int iVisionsDone = ArtifactVisionNumber.GetValueInt()
  wwiseevent myAudio = VisionArray[iVisionsDone].VisionWWiseEvent
  String myBink = VisionArray[iVisionsDone].VisionBink
  myAudio.Play(Game.GetPlayer() as ObjectReference, None, None)
  Game.PlayBink(myBink, False, False, False, True, False)
  iVisionsDone += 1
  ArtifactVisionNumber.SetValueInt(iVisionsDone)
EndFunction

Function PlayArtifactVisionNoWait()
  Int iVisionsDone = ArtifactVisionNumber.GetValueInt()
  wwiseevent myAudio = VisionArray[iVisionsDone].VisionWWiseEvent
  String myBink = VisionArray[iVisionsDone].VisionBink
  myAudio.Play(Game.GetPlayer() as ObjectReference, None, None)
  Game.PlayBinkNoWait(myBink, False, False, False, True, False, True)
  iVisionsDone += 1
  ArtifactVisionNumber.SetValueInt(iVisionsDone)
EndFunction
