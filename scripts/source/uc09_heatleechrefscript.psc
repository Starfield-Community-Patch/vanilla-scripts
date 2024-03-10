ScriptName UC09_HeatleechRefScript Extends Actor

;-- Variables ---------------------------------------
Float Timestamp = 0.0

;-- Properties --------------------------------------
GlobalVariable Property UC09_Result Auto Const mandatory
{ Global used to manage the player's gameplay results after the UC questline }
GlobalVariable Property UC09_LeechNestCleanUpChance Auto Const mandatory
{ Percent chance a Heatleech nest will clean itself up when its loaded post-UC questline }
GlobalVariable Property UC09_LeechNestCleanUpCooldownLength Auto Const mandatory
{ If this nest isn't turned off, this global is used to manage how long we wait before checking again }
Bool Property DisableOnLoadAfterQuestline = True Auto Const
{ If you don't want this Heatleech nest disabling automatically on load, set this to "FALSE". 
NOTE: This should only be used for quest-related or scene objects. Ambiently placed ones should be always be marked "TRUE" }
Keyword Property DMP_AmbushMarker Auto Const mandatory
{ Keyword to connect the Leech to its ambush marker }
Keyword Property LinkAmbushTrigger Auto Const mandatory
{ Keyword to connect the Leech to its ambush trigger }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If DisableOnLoadAfterQuestline
    If UC09_Result.GetValue() > 0.0 && !Self.IsDisabled() && !Self.IsDestroyed() && Timestamp < Utility.GetCurrentGameTime()
      Int iRand = Utility.RandomInt(0, 100)
      If iRand <= UC09_LeechNestCleanUpChance.GetValueInt()
        Self.Disable(False)
        Self.SetDestroyed(True)
        ObjectReference AmbushTriggerRef = Self.GetLinkedRef(LinkAmbushTrigger)
        If AmbushTriggerRef != None
          AmbushTriggerRef.Disable(False)
          AmbushTriggerRef.SetDestroyed(True)
        EndIf
        ObjectReference AmbushMarkerRef = Self.GetLinkedRef(DMP_AmbushMarker)
        If AmbushMarkerRef != None
          AmbushMarkerRef.Disable(False)
          AmbushMarkerRef.SetDestroyed(True)
        EndIf
      Else
        Timestamp = Utility.GetCurrentGameTime() + UC09_LeechNestCleanUpCooldownLength.GetValue()
      EndIf
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
