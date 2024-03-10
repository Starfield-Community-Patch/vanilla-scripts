ScriptName Fragments:Quests:QF_RL088_EavesdroppingScene_00246FCB Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  rl088script kmyQuest = __temp as rl088script
  kmyQuest.StartGravityCountdown(7, 7)
EndFunction
