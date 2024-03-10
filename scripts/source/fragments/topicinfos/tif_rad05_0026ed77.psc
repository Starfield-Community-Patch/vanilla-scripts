ScriptName Fragments:TopicInfos:TIF_RAD05_0026ED77 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RAD05_Mercenary_Debt Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().removeitem(Credits as Form, RAD05_Mercenary_Debt.GetValue() as Int, False, None)
EndFunction
