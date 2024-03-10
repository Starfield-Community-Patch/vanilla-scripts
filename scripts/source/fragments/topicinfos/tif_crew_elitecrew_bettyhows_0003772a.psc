ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_BettyHows_0003772A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CrewHiringCost Auto Const
Quest Property BettyECQuest Auto Const
MiscObject Property Credits Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  BettyECQuest.SetStage(700)
  Game.GetPlayer().RemoveItem(Credits as Form, CrewHiringCost.GetValueInt(), False, None)
EndFunction
