ScriptName ThrallCollVOCleanUpScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Int iTimerID = 1 Const

;-- Properties --------------------------------------
MagicEffect Property CrTerrormorphMindControlEffect_NPC Auto Const mandatory
{ The NPC mind control property }
Int Property TimerLength = 5 Auto Const
{ How frequently we check to see if there's any NPCs in the list that need their VO cleaned up }
VoiceType Property NPCFTerrormorphThrall Auto Const mandatory
{ Female Terrormorph voicetype }
VoiceType Property NPCMTerrormorphThrall Auto Const mandatory
{ Male Terrormorph voicetype }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.StartCheck()
EndEvent

Function StartCheck()
  Self.StartTimer(TimerLength as Float, iTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID
    If Self.GetCount() > 0
      Self.RunVOCleanUp()
    Else
      Self.StartCheck()
    EndIf
  EndIf
EndEvent

Function RunVOCleanUp()
  Int I = Self.GetCount() - 1
  While I >= 0
    Actor currAct = Self.GetAt(I) as Actor
    If currAct != None
      Self.AttemptVOCleanUp(currAct)
    EndIf
    I -= 1
  EndWhile
  Self.StartCheck()
EndFunction

Function AttemptVOCleanUp(Actor akActorRef)
  If !akActorRef.HasMagicEffect(CrTerrormorphMindControlEffect_NPC)
    VoiceType currVoiceType = akActorRef.GetVoiceType()
    If currVoiceType == NPCFTerrormorphThrall || currVoiceType == NPCMTerrormorphThrall
      akActorRef.SetOverrideVoiceType(None)
    EndIf
    Self.RemoveRef(akActorRef as ObjectReference)
  EndIf
EndFunction
