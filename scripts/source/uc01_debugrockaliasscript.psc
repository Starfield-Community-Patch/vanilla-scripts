ScriptName UC01_DebugRockAliasScript Extends ReferenceAlias

;-- Structs -----------------------------------------
Struct SequenceDatum
  String Description
  { Quick editor-facing description of which sequence this is }
  Int ButtonInt
  { Message box button we're looking for. This should match the index in the UC01_ShipSim_DebugMenu message object }
  ActorValue ManagingValue
  { Actor value used to drive this sequence }
  Float ValueMax
  { Actor value level to express it's at its max }
  Float ValueMin
  { Actor value level to express it's at its min }
  Scene StartUpScene
  { Scene to play when this sequence starts }
  Scene PowerUpScene
  { Scene to play when this sequence goes from low to high }
  Scene PowerDownScene
  { Scene to play when this sequence goes from high to low }
  Scene WrapUpScene
  { Scene to play when the whole sequence is finished }
  Float MaxSwings
  { How many times we should swing between max and min }
  Float SwingTimeMin
  { The max amount of time a swing should last }
  Float SwingTimeMax
  { The min amount of time a swing should last }
EndStruct


;-- Variables ---------------------------------------
Int iSwingCount
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Message Property UC01_ShipSim_DebugMenu Auto Const mandatory
{ Main debug menu }
uc01_debugrockaliasscript:sequencedatum[] Property SequenceData Auto Const mandatory
{ Collection of each sequence types data }
Quest Property UC01 Auto Const mandatory
{ UC01 base quest property }
Int Property PlayerUsedDebugSystemStage = 420 Auto Const
{ Stage to set on UC01 if the player uses this system }
Int Property ActiveSequence = -1 Auto
{ If there's a sequence active, store it here }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If ActiveSequence == -1
    Int ButtonReturn = UC01_ShipSim_DebugMenu.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Int iIndex = SequenceData.findstruct("ButtonInt", ButtonReturn, 0)
    If iIndex >= 0
      ActiveSequence = iIndex
      If UC01.IsRunning()
        UC01.SetStage(PlayerUsedDebugSystemStage)
      EndIf
      uc01_debugrockaliasscript:sequencedatum myDatum = SequenceData[ActiveSequence]
      myDatum.StartUpScene.Start()
      Float RandLength = Utility.RandomFloat(myDatum.SwingTimeMin, myDatum.SwingTimeMax)
      Self.StartTimer(RandLength, iTimerID)
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID
    uc01_debugrockaliasscript:sequencedatum myDatum = SequenceData[ActiveSequence]
    myDatum.WrapUpScene.Start()
    ActiveSequence = -1
  EndIf
EndEvent
