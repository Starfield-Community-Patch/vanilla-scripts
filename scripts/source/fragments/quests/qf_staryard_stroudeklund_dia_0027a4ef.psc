ScriptName Fragments:Quests:QF_Staryard_StroudEklund_Dia_0027A4EF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SY_StroudEklund_100_Intro Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  SY_StroudEklund_100_Intro.Start()
EndFunction

Function Fragment_Stage_0900_Item_00()
  If SY_StroudEklund_100_Intro.IsPlaying()
    SY_StroudEklund_100_Intro.Stop()
  EndIf
EndFunction
