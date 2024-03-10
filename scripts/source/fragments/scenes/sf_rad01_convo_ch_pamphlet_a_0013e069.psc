ScriptName Fragments:Scenes:SF_Rad01_Convo_Ch_Pamphlet_A_0013E069 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property Rad01_Pamphlet Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  Game.GetPlayer().RemoveItem(Rad01_Pamphlet as Form, 1, False, None)
EndFunction
