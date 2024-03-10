ScriptName OE_AliasOnDistanceLessThan Extends ReferenceAlias default
{ Sets a stage when the distance between this an a target alias is less than a target distance. }

;-- Variables ---------------------------------------
Actor Player

;-- Properties --------------------------------------
Group Required_Data
  ReferenceAlias Property TargetAlias Auto Const mandatory
  { The Alias to check versus the Owning Alias }
  Bool Property CheckPlayer Auto Const mandatory
  { This checks the Player to see if they are }
  Float Property TargetDistance Auto Const mandatory
  { The needed distance between this and the target }
  Int Property StageToSet = -1 Auto Const mandatory
  { Stage to Set }
EndGroup

Group Optional_Data
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Player = Game.GetPlayer()
  Quest myQuest = Self.GetOwningQuest()
  If PrereqStage > -1 && myQuest.GetStageDone(PrereqStage) == False
    Self.RegisterForRemoteEvent(myQuest as ScriptObject, "OnStageSet")
  Else
    If CheckPlayer
      Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0)
    EndIf
    If TargetAlias
      Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0)
    EndIf
  EndIf
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0)
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If StageToSet > -1
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent
