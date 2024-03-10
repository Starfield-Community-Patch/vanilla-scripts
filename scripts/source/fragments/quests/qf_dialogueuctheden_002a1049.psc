ScriptName Fragments:Quests:QF_DialogueUCTheDen_002A1049 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFDenR01 Auto Const mandatory
Scene Property pDialogueUCTheDen_IntroScene Auto Const mandatory
Quest Property UC06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  If !UC06.IsRunning()
    pDialogueUCTheDen_IntroScene.Start()
  Else
    Self.SetStage(5)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  FFDenR01.SetStage(10)
EndFunction
