ScriptName Fragments:TopicInfos:TIF_Staryard_Trident_Z_Fueli_002E7CA5 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property VelocityRemoved Auto Const
Potion Property VelocityBlue Auto Const
Potion Property VelocityGreen Auto Const
Potion Property VelocityOrange Auto Const
Potion Property VelocityRed Auto Const
Potion Property VelocityTeal Auto Const
Potion Property VelocityViolet Auto Const
Potion Property VelocityYellow Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityBlue as Form) >= 1
    VelocityRemoved.Mod(1.0)
    Game.GetPlayer().RemoveItem(VelocityBlue as Form, 1, False, None)
  EndIf
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityGreen as Form) >= 1
    VelocityRemoved.Mod(1.0)
    Game.GetPlayer().RemoveItem(VelocityGreen as Form, 1, False, None)
  EndIf
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityOrange as Form) >= 1
    VelocityRemoved.Mod(1.0)
    Game.GetPlayer().RemoveItem(VelocityOrange as Form, 1, False, None)
  EndIf
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityRed as Form) >= 1
    VelocityRemoved.Mod(1.0)
    Game.GetPlayer().RemoveItem(VelocityRed as Form, 1, False, None)
  EndIf
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityTeal as Form) >= 1
    VelocityRemoved.Mod(1.0)
    Game.GetPlayer().RemoveItem(VelocityTeal as Form, 1, False, None)
  EndIf
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityViolet as Form) >= 1
    VelocityRemoved.Mod(1.0)
    Game.GetPlayer().RemoveItem(VelocityViolet as Form, 1, False, None)
  EndIf
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityYellow as Form) >= 1
    VelocityRemoved.Mod(1.0)
    Game.GetPlayer().RemoveItem(VelocityYellow as Form, 1, False, None)
  EndIf
EndFunction
