ScriptName TestElectricityArcScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property bPowered = True Auto
Spell Property ElectricitySpell Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Bool Property bRandomTarget = False Auto
{ Set to true if you want this to arc to the player randomly if they're nearby }

;-- Functions ---------------------------------------

Event OnLoad()
  If bPowered && bRandomTarget
    Self.ElectrifyRandomTarget()
  ElseIf bPowered
    Self.ElectrifyTarget()
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If bPowered
    bPowered = False
  ElseIf bPowered == False && bRandomTarget
    bPowered = True
    Self.ElectrifyRandomTarget()
  ElseIf bPowered == False
    Self.ElectrifyTarget()
  EndIf
EndEvent

Function ElectrifyTarget()
  While bPowered
    Float fRandom = Utility.RandomFloat(0.200000003, 3.0)
    ElectricitySpell.Cast(Self.GetLinkedRef(LinkCustom01), Self.GetLinkedRef(LinkCustom02))
    Utility.Wait(fRandom)
  EndWhile
EndFunction

Function ElectrifyRandomTarget()
  While bPowered
    Int iRandom = Utility.RandomInt(1, 100)
    Float fRandom = Utility.RandomFloat(0.200000003, 3.0)
    Float fDistance = Game.GetPlayer().GetDistance(Self.GetLinkedRef(LinkCustom01))
    If iRandom <= 50 && fDistance < 12.0
      ElectricitySpell.Cast(Self.GetLinkedRef(LinkCustom01), Game.GetPlayer() as ObjectReference)
    Else
      ElectricitySpell.Cast(Self.GetLinkedRef(LinkCustom01), Self.GetLinkedRef(LinkCustom02))
    EndIf
    Utility.Wait(fRandom)
  EndWhile
EndFunction
