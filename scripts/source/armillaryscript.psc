ScriptName ArmillaryScript Extends ObjectReference

;-- Structs -----------------------------------------
Struct ArtifactStruct
  MiscObject ArtifactMiscObject
  String ArtifactAnimation = "None"
  Bool IsArtifactAdded
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
armillaryscript:artifactstruct[] Property ArtifactArray Auto
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
GlobalVariable Property MQArmillaryCompleteGlobal Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Location Property CityNewAtlantisLodgeLocation Auto Const mandatory
Int Property ArmillaryTogetherStage = 1635 Auto Const
Quest Property MQ00 Auto Const mandatory
ReferenceAlias Property Artifact01QuestObject Auto Const mandatory
ReferenceAlias Property Artifact02QuestObject Auto Const mandatory
conditionform Property MQ104AArtifactCollectionActivateCheck Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.IsDisabled() == False
    Self.AssembleArmillary()
    If Self.IsInLocation(CityNewAtlantisLodgeLocation) && MQ101.GetStageDone(ArmillaryTogetherStage) == False && MQ101.IsRunning()
      Self.PlayAnimation("AlphaStart")
    EndIf
  EndIf
EndEvent

Function AssembleArmillary()
  Self.SetAnimationVariableBool("IsInstantInit", True)
  Int currentElement = 0
  Bool ArmillaryOpened = False
  While currentElement < ArtifactArray.Length
    String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded
    If CurrentIsArtifactAdded
      If ArmillaryOpened == False
        Self.PlayAnimation("AlphaStart")
        Self.PlayAnimation("Open")
        ArmillaryOpened = True
      EndIf
      If CurrentAnimation != "None"
        Self.PlayAnimation(CurrentAnimation)
      EndIf
    EndIf
    currentElement += 1
  EndWhile
  Self.SetAnimationVariableBool("IsInstantInit", False)
EndFunction

Function BuildArmillary(Actor akActorREF, ObjectReference akMountOrScreen)
  If MQ305.IsRunning()
    MQ305.SetStage(40)
  EndIf
  Self.PlayAnimation("Open")
  Int currentElement = 0
  While currentElement < ArtifactArray.Length
    MiscObject CurrentArtifactObject = ArtifactArray[currentElement].ArtifactMiscObject
    String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded
    If akActorREF.GetItemCount(CurrentArtifactObject as Form) >= 1
      Bool SkipCurrentArtifact = False
      If !MQ104AArtifactCollectionActivateCheck.IsTrue(None, None) && ((Artifact01QuestObject.GetRef().GetBaseObject() == CurrentArtifactObject as Form) || (Artifact02QuestObject.GetRef().GetBaseObject() == CurrentArtifactObject as Form))
        SkipCurrentArtifact = True
      EndIf
      If !SkipCurrentArtifact
        akActorREF.RemoveItem(CurrentArtifactObject as Form, 9999, True, None)
        If CurrentAnimation != "None"
          Self.PlayAnimation(CurrentAnimation)
        EndIf
        ArtifactArray[currentElement].IsArtifactAdded = True
      EndIf
    EndIf
    If MQ305.IsRunning()
      If ArtifactArray[currentElement].IsArtifactAdded == False
        Self.PlayAnimation(CurrentAnimation)
        ArtifactArray[currentElement].IsArtifactAdded = True
      EndIf
    EndIf
    currentElement += 1
  EndWhile
  MQ00_ArtifactsHolder.RemoveAll()
  Self.CheckArmillaryComplete()
  If akMountOrScreen != None
    (MQ00 as mq00questscript).ArmillaryPlaced(Self as ObjectReference, akMountOrScreen)
  EndIf
EndFunction

Function BuildCompleteArmillary()
  Int currentElement = 0
  While currentElement < ArtifactArray.Length
    String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation
    Self.PlayAnimation(CurrentAnimation)
    currentElement += 1
  EndWhile
EndFunction

Function CheckArmillaryComplete()
  Int iArtifactsCollected = 0
  Int iMaxArtifacts = ArtifactArray.Length
  Int currentElement = 0
  While currentElement < ArtifactArray.Length
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded
    If CurrentIsArtifactAdded
      iArtifactsCollected += 1
    EndIf
    currentElement += 1
  EndWhile
  If iArtifactsCollected >= iMaxArtifacts
    MQArmillaryCompleteGlobal.SetValueInt(1)
  Else
    MQArmillaryCompleteGlobal.SetValueInt(0)
  EndIf
  If MQ305.IsRunning()
    Int iArmillaryComplete = MQArmillaryCompleteGlobal.GetValueInt()
    (MQ305 as mq305script).ArmillaryPlaced(iArmillaryComplete)
  EndIf
EndFunction

Function PackupArmillary(Actor akActorREF)
  Int currentElement = 0
  While currentElement < ArtifactArray.Length
    MiscObject CurrentArtifactObject = ArtifactArray[currentElement].ArtifactMiscObject
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded
    If CurrentIsArtifactAdded == True
      akActorREF.AddAliasedItem(CurrentArtifactObject as Form, MQ00_ArtifactsHolder as Alias, 1, True)
      ArtifactArray[currentElement].IsArtifactAdded = False
    EndIf
    currentElement += 1
  EndWhile
  Self.PlayAnimation("Close")
  MQArmillaryCompleteGlobal.SetValueInt(0)
  (MQ00 as mq00questscript).ArmillaryRemoved()
EndFunction

Function MQ101ArmillaryComesTogether()
  Self.PlayAnimation("Activate")
  ArtifactArray[0].IsArtifactAdded = True
  ArtifactArray[5].IsArtifactAdded = True
  ArtifactArray[18].IsArtifactAdded = True
EndFunction

Function DebugSetArtifactAdded(Int iArtifactNumber)
  ArtifactArray[iArtifactNumber].IsArtifactAdded = True
EndFunction
