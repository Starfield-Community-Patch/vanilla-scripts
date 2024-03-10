ScriptName UC09_HeatleechAmbushMarkerScript Extends ObjectReference

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

;-- Functions ---------------------------------------

Event OnLoad()
  If DisableOnLoadAfterQuestline
    If UC09_Result.GetValue() > 0.0 && !Self.IsDisabled() && !Self.IsDestroyed() && Timestamp < Utility.GetCurrentRealTime()
      Actor[] LinkedActors = Self.GetActorsLinkedToMe(DMP_AmbushMarker, None)
      If LinkedActors.Length <= 0
        Int iRand = Utility.RandomInt(0, 100)
        If iRand <= UC09_LeechNestCleanUpChance.GetValueInt()
          Self.Disable(False)
          Self.SetDestroyed(True)
        Else
          Timestamp = Utility.GetCurrentRealTime() + UC09_LeechNestCleanUpCooldownLength.GetValue()
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent
