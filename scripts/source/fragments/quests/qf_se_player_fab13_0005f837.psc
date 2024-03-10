ScriptName Fragments:Quests:QF_SE_Player_FAB13_0005F837 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_FAB13_050_SeaShanty Auto Const mandatory
ReferenceAlias Property Alias_SingingCaptain Auto Const mandatory
GlobalVariable Property SE_FAB13_SeaChanty Auto Const mandatory
Scene Property SE_FAB13_060_SeaShanty02 Auto Const mandatory
Scene Property SE_FAB13_070_SeaShanty03 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference oTarg = Alias_SingingCaptain.GetRef() as spaceshipreference
  oTarg.SetValue(Aggression, 0.0)
EndFunction

Function Fragment_Stage_0040_Item_00()
  If SE_FAB13_SeaChanty.GetValue() == 0.0
    SE_FAB13_050_SeaShanty.Start()
  ElseIf SE_FAB13_SeaChanty.GetValue() == 1.0
    SE_FAB13_060_SeaShanty02.Start()
  Else
    SE_FAB13_070_SeaShanty03.Start()
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  If SE_FAB13_SeaChanty.GetValue() == 0.0
    SE_FAB13_050_SeaShanty.Start()
  ElseIf SE_FAB13_SeaChanty.GetValue() == 1.0
    SE_FAB13_060_SeaShanty02.Start()
  Else
    SE_FAB13_070_SeaShanty03.Start()
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(2.0)
  (Alias_SingingCaptain.GetRef() as spaceshipreference).DisableWithGravJump()
EndFunction

Function Fragment_Stage_1000_Item_00()
  If SE_FAB13_SeaChanty.GetValue() == 2.0
    SE_FAB13_SeaChanty.SetValue(0.0)
  Else
    SE_FAB13_SeaChanty.Mod(1.0)
  EndIf
EndFunction
