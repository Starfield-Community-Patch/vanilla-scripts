ScriptName RI_RadiantSupportQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_MBQuestCount Auto Const mandatory
GlobalVariable Property RI_NPCRadiantAvailable Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
Int Property iStartStage = 10 Auto Const
Keyword Property RI_RadiantQuestStartKeyword Auto Const mandatory
Int Property iCurrentMBCount Auto conditional
RefCollectionAlias Property VentDoors Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.ResetMBCount()
EndEvent

Function ResetMBCount()
  Int iMBCount = Utility.RandomInt(3, 5)
  RI_MBQuestCount.SetValueInt(iMBCount)
  RI_NPCRadiantAvailable.SetValue(0.0)
EndFunction

Function MBCompleted()
  iCurrentMBCount += 1
  If iCurrentMBCount >= RI_MBQuestCount.GetValueInt() && RI_NPCRadiantAvailable.GetValue() == 0.0
    RI_NPCRadiantAvailable.SetValue(1.0)
    RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
    iCurrentMBCount = 0
  EndIf
EndFunction

Function LockVentDoors()
  Int TotalVentDoors = VentDoors.GetCount()
  Int Current = 0
  While Current < TotalVentDoors
    ObjectReference ChosenRef = VentDoors.GetAt(Current)
    ChosenRef.Lock(True, False, True)
    ChosenRef.SetLockLevel(254)
    Current += 1
  EndWhile
EndFunction

Function UnlockVentDoors()
  Int TotalVentDoors = VentDoors.GetCount()
  Int Current = 0
  While Current < TotalVentDoors
    ObjectReference ChosenRef = VentDoors.GetAt(Current)
    ChosenRef.Unlock(False)
    Current += 1
  EndWhile
EndFunction

Function BountyReceived(Quest myQuest)
  (myQuest as ri_crimetrackingquestscript).iBountiesGained = (myQuest as ri_crimetrackingquestscript).iBountiesGained + 1
EndFunction
