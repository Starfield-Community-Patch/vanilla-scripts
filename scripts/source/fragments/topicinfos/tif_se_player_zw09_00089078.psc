ScriptName Fragments:TopicInfos:TIF_SE_Player_ZW09_00089078 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property Pse_zw09_Diamond_Warranty Auto Const mandatory
Book Property Pse_zw09_Platinum_Warranty Auto Const mandatory
Quest Property PSE_Player_ZW09 Auto Const mandatory
Book Property Pse_player_zw09_Platinum_Warranty Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.getplayer().RemoveItem(Game.GetCredits() as Form, 200000, False, None)
  Game.getplayer().AddItem(Pse_player_zw09_Platinum_Warranty as Form, 1, False)
  PSE_Player_ZW09.setstage(300)
EndFunction
