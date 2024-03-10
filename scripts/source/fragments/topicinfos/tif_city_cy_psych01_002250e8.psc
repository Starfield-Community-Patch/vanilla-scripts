ScriptName Fragments:TopicInfos:TIF_City_CY_Psych01_002250E8 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SlateMarker Auto Const
ReferenceAlias Property Hank Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ObjectReference myMarker = SlateMarker.GetRef()
  ObjectReference myNPC = Hank.GetRef()
  myMarker.MoveTo(myNPC, 0.100000001, 0.200000003, 1.0, True, True)
EndFunction
