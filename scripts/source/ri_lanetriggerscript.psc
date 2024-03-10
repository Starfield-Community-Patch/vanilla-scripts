ScriptName RI_LaneTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueFCRyujinTower_Lane_GreetingsScene Auto Const mandatory
GlobalVariable Property RI_LaneGreetingTracker Auto Const mandatory
GlobalVariable Property GameDay Auto Const mandatory
Int Property StageToCheck Auto Const mandatory
Quest Property RI01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Float iCurrentDay = GameDay.GetValue()
  If RI01.GetStageDone(StageToCheck)
    If (akActionRef == Game.GetPlayer() as ObjectReference) && RI_LaneGreetingTracker.GetValue() != iCurrentDay
      DialogueFCRyujinTower_Lane_GreetingsScene.Start()
      RI_LaneGreetingTracker.SetValue(iCurrentDay)
    EndIf
  EndIf
EndEvent
