ScriptName Fragments:TopicInfos:TIF_City_NewAtlantis_Z_GemJe_000C557F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_George Auto Const
ReferenceAlias Property Alias_Plate Auto Const
ReferenceAlias Property Alias_Gem Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Alias_George.GetActorRef().RemoveItem(Alias_Gem.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Plate.GetRef() as Form, 1, False, None)
  Alias_George.GetActorRef().AddItem(Alias_Plate.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Gem.GetRef() as Form, 1, False)
EndFunction
