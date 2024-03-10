ScriptName RL082Spawner Extends TerminalMenu
{ Spawns shoots clutter and loot out of conveyor opening in Zero G }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PackageSpawnMarker Auto
movablestatic[] Property packageArray Auto Const
GlobalVariable Property RL082StorageTerminal Auto
LeveledItem[] Property LootItems Auto Const
Int Property menuItemID_01 = 1 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.HandleMenuItem(auiMenuItemID)
EndEvent

Function HandleMenuItem(Int auiMenuItemID)
  If auiMenuItemID == menuItemID_01
    RL082StorageTerminal.SetValue(1.0)
    Self.StartTimer(0.100000001, 0)
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  Int I = 0
  While I < packageArray.Length
    Utility.wait(Utility.RandomFloat(0.100000001, 0.150000006))
    ObjectReference newPackage = PackageSpawnMarker.PlaceAtMe(packageArray[I] as Form, 1, False, False, True, None, None, True)
    newPackage.SetAngle(Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0))
    newPackage.ApplyHavokImpulse(-1.0, 0.0, 0.0, Utility.RandomFloat(15.0, 17.0))
    I += 1
  EndWhile
  I = 0
  While I < LootItems.Length
    Utility.wait(Utility.RandomFloat(0.100000001, 0.150000006))
    ObjectReference newLoot = PackageSpawnMarker.PlaceAtMe(LootItems[I] as Form, 1, False, False, True, None, None, True)
    newLoot.SetAngle(Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0))
    newLoot.ApplyHavokImpulse(-1.0, 0.0, 0.0, Utility.RandomFloat(5.0, 7.0))
    I += 1
  EndWhile
EndEvent
