;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_City_CY_Psych01_00225109 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ObjectReference myMarker = SlateMarker.GetRef()
ObjectReference myNPC = Samund.GetRef()
myMarker.MoveTo(myNPC, afXOffset = 0.1, afYOffset = 0.2, afZOffset = 1.0, abMatchRotation = True, abRotateOffset = True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SlateMarker Auto Const

ReferenceAlias Property Samund Auto Const
