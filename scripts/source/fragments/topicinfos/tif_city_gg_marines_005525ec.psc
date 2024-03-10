ScriptName Fragments:TopicInfos:TIF_City_GG_Marines_005525EC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property UC_GG_Marines_ViktorBribe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemoveItem(Credits as Form, UC_GG_Marines_ViktorBribe.GetValueInt(), False, None)
  Self.GetOwningQuest().SetStage(410)
EndFunction
