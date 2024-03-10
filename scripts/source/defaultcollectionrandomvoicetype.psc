ScriptName DefaultCollectionRandomVoiceType Extends RefCollectionAlias default
{ used to use a random voice from a formlist of voicetypes to reference(s) in the alias }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup

FormList Property VoicesList Auto Const mandatory
{ The formlist with random voices you want to select from.
IMPORTANT: make sure the alias has the same formlist in the Export drop down if they are getting new dialogue in this quest. }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor[] actors = Self.GetActorArray()
  Int iActor = 0
  While iActor < actors.Length
    Actor actorRef = actors[iActor]
    VoiceType forcedVoice = actorRef.SetOverrideVoiceTypeRandom(VoicesList)
    iActor += 1
  EndWhile
EndEvent
