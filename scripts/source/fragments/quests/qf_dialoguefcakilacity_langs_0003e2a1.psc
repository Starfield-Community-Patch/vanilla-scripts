ScriptName Fragments:Quests:QF_DialogueFCAkilaCity_Langs_0003E2A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property AkilaCityLife_2030_Frank Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  AkilaCityLife_2030_Frank.Start()
  DialogueFCAkilaCity.SetStage(2030)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop()
EndFunction
