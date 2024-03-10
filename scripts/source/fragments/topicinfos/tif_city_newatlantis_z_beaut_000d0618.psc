ScriptName Fragments:TopicInfos:TIF_City_NewAtlantis_Z_Beaut_000D0618 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Slate Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None)
EndFunction
