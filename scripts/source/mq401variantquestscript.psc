ScriptName MQ401VariantQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias[] Property RefAliasesToEnableArray Auto Const
Bool Property MQ402NoLodgeArtifacts Auto Const
GlobalVariable Property MQ401_NoLodgeArtifacts Auto Const mandatory
Int Property QuestInitStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  If RefAliasesToEnableArray != None
    Self.EnableQuestActors()
  EndIf
  If MQ402NoLodgeArtifacts
    MQ401_NoLodgeArtifacts.SetValueInt(1)
  EndIf
  Self.SetStage(QuestInitStage)
EndEvent

Function EnableQuestActors()
  Int currentElement = 0
  While currentElement < RefAliasesToEnableArray.Length
    RefAliasesToEnableArray[currentElement].GetActorRef().Enable(False)
    currentElement += 1
  EndWhile
EndFunction
