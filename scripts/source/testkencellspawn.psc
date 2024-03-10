ScriptName TestKenCellSpawn Extends ObjectReference Const

;-- Functions ---------------------------------------

Function SpawnCell()
  Form ObjectBase = Game.GetForm(2741888)
  Cell ObjectCell = ObjectBase as Cell
  Float[] offsetValues = new Float[3]
  offsetValues[0] = 0.0
  offsetValues[1] = 0.0
  offsetValues[2] = 0.0
  Cell newCell = Self.PlaceCellAtMe(ObjectCell, None, False, True, False, offsetValues)
EndFunction
