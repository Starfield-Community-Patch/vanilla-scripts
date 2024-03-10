ScriptName MQ305UnityArmillaryScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnLoad()
  (Self.GetRef() as armillaryscript).BuildCompleteArmillary()
EndEvent
