ScriptName TestAddToInventoryOnDestroy Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Loot_IcyAsteroid Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akDestroyer)
  Game.GetPlayer().AddItem(LL_Loot_IcyAsteroid as Form, 1, False)
EndEvent
