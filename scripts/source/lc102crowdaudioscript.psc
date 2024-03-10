ScriptName LC102CrowdAudioScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CrowdAudioMarkerKeyword Auto Const
Keyword Property CrowdFleeAudioMarkerKeyword Auto Const
Int Property MinCrowdPopulation = 10 Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Actor player = Game.GetPlayer()
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnCombatStateChanged")
  Int playerCombatState = player.GetCombatState()
  If playerCombatState == 0
    Self.DisableFleeAudio()
    Self.EvaluateActorPopulation()
  ElseIf playerCombatState == 1
    Self.DisableCrowdAudio()
    Self.EnableFleeAudio()
  EndIf
EndEvent

Event OnUnload()
  Actor player = Game.GetPlayer()
  Self.UnregisterForRemoteEvent(player as ScriptObject, "OnCombatStateChanged")
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 0
    Self.DisableFleeAudio()
    Self.EvaluateActorPopulation()
  ElseIf aeCombatState == 1
    Self.DisableCrowdAudio()
    Self.EnableFleeAudio()
  EndIf
EndEvent

Function EvaluateActorPopulation()
  Int objCount = Self.GetTriggerObjectCount()
  If objCount < MinCrowdPopulation
    Self.DisableCrowdAudio()
  Else
    Self.EnableCrowdAudio()
  EndIf
EndFunction

Function EnableCrowdAudio()
  ObjectReference crowdAudioMarkerRef = Self.GetLinkedRef(CrowdAudioMarkerKeyword)
  If crowdAudioMarkerRef != None && crowdAudioMarkerRef.IsEnabled() == False
    crowdAudioMarkerRef.Enable(False)
  EndIf
EndFunction

Function DisableCrowdAudio()
  ObjectReference crowdAudioMarkerRef = Self.GetLinkedRef(CrowdAudioMarkerKeyword)
  If crowdAudioMarkerRef != None && crowdAudioMarkerRef.IsEnabled() == True
    crowdAudioMarkerRef.Disable(False)
  EndIf
EndFunction

Function EnableFleeAudio()
  ObjectReference crowdFleeAudioMarkerRef = Self.GetLinkedRef(CrowdFleeAudioMarkerKeyword)
  If crowdFleeAudioMarkerRef != None && crowdFleeAudioMarkerRef.IsEnabled() == False
    crowdFleeAudioMarkerRef.Enable(False)
  EndIf
EndFunction

Function DisableFleeAudio()
  ObjectReference crowdFleeAudioMarkerRef = Self.GetLinkedRef(CrowdFleeAudioMarkerKeyword)
  If crowdFleeAudioMarkerRef != None && crowdFleeAudioMarkerRef.IsEnabled() == True
    crowdFleeAudioMarkerRef.Disable(False)
  EndIf
EndFunction
