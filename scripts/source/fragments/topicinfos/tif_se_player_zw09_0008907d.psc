ScriptName Fragments:TopicInfos:TIF_SE_Player_ZW09_0008907D Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property Pse_zw09_Powerplant_Warranty Auto Const mandatory
Quest Property PSE_Player_ZW09 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.getplayer().RemoveItem(Game.GetCredits() as Form, 50000, False, None)
  Game.getplayer().AddItem(Pse_zw09_Powerplant_Warranty as Form, 1, False)
  PSE_Player_ZW09.setstage(300)
EndFunction
