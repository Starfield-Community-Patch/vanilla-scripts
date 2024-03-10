ScriptName DefaultEnableAliasesQuestScript Extends Quest Const default
{ enabled aliases on start or quest stages }

;-- Structs -----------------------------------------
Struct AliasEnableDatum
  Alias AliasToEnable
  Int StageToEnable = -1
  { Stage to enable, if -1 (default) will enable at quest start }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultenablealiasesquestscript:aliasenabledatum[] Property AliasEnableData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.EnableAliasByStage(-1)
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  Self.EnableAliasByStage(auiStageID)
EndEvent

Function EnableAliasByStage(Int EnableStage)
  defaultenablealiasesquestscript:aliasenabledatum[] enableData = AliasEnableData.GetMatchingStructs("StageToEnable", EnableStage, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
  Int I = 0
  While I < enableData.Length
    defaultenablealiasesquestscript:aliasenabledatum currentDatum = enableData[I]
    ReferenceAlias ReferenceAliasToEnable = currentDatum.AliasToEnable as ReferenceAlias
    If ReferenceAliasToEnable
      ReferenceAliasToEnable.TryToEnable()
    Else
      RefCollectionAlias RefCollectionAliasToEnable = currentDatum.AliasToEnable as RefCollectionAlias
      If RefCollectionAliasToEnable
        RefCollectionAliasToEnable.EnableAll(False)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction
