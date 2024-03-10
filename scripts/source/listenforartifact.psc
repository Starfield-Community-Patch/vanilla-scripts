ScriptName ListenForArtifact Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property VisionStartedStage Auto Const mandatory
Int Property VisionEndedStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  buriedartifact myRef = Self.GetRef() as buriedartifact
  Self.RegisterForCustomEvent(myRef as ScriptObject, "buriedartifact_OnArtifactAcquireEnded")
  Self.RegisterForCustomEvent(myRef as ScriptObject, "buriedartifact_OnArtifactAcquireStarted")
EndEvent

Event BuriedArtifact.OnArtifactAcquireEnded(buriedartifact akSender, Var[] akArgs)
  Self.GetOwningQuest().SetStage(50)
EndEvent

Event BuriedArtifact.OnArtifactAcquireStarted(buriedartifact akSender, Var[] akArgs)
  Self.GetOwningQuest().SetStage(49)
EndEvent
