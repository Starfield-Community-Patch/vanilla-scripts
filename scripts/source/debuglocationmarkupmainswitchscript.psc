ScriptName DebugLocationMarkupMainSwitchScript Extends ObjectReference

;-- Variables ---------------------------------------
String ThisButtonsName = "Start All Quests"

;-- Properties --------------------------------------
FormList Property FormlistOfQuestsToStart Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int numQuestsFailedToStart = 0
  Int formlistCount = 0
  Int formlistSize = FormlistOfQuestsToStart.GetSize()
  While formlistCount < formlistSize
    Quest currentQuest = FormlistOfQuestsToStart.GetAt(formlistCount) as Quest
    If !(FormlistOfQuestsToStart.GetAt(formlistCount) as Quest).Start()
      numQuestsFailedToStart += 1
    EndIf
    formlistCount += 1
  EndWhile
  If numQuestsFailedToStart < 1
    
  EndIf
EndEvent
