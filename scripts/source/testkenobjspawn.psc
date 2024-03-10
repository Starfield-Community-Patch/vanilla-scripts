ScriptName TestKenObjSpawn Extends ObjectReference Const

;-- Functions ---------------------------------------

Function SpawnObject()
  Form ObjectBase = Game.GetForm(1743617)
  Float[] offsetValues = new Float[3]
  offsetValues[0] = 100.0
  offsetValues[1] = 100.0
  offsetValues[2] = 0.0
  ObjectReference newObj = Self.PlaceAtMe(ObjectBase, 1, False, False, True, offsetValues, None, True)
EndFunction
