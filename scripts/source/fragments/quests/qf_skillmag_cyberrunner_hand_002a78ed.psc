ScriptName Fragments:Quests:QF_SkillMag_CyberRunner_Hand_002A78ED Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SecurityMenuMaxAutoattemptPoints Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Game.GetPlayer().SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0)
EndFunction
