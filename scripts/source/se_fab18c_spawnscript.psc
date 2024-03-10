ScriptName SE_FAB18c_SpawnScript Extends Quest

;-- Variables ---------------------------------------
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Quest Property SE_Player_FAB18c Auto Const mandatory
GlobalVariable Property MS02_GenghisSpawnChance Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
GlobalVariable Property MS02_Genghis_SE_ID Auto Const mandatory
Float Property SE_ID Auto Const
Float Property TimeToWait Auto Const
Float Property FallbackTimer = 7.0 Auto Const
ReferenceAlias Property ShipToCheck Auto Const
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnQuestStarted()
  If MS02_GenghisReactivity.GetValue() == 3.0
    Float fRoll = Utility.RandomInt(1, 100) as Float
    If fRoll <= MS02_GenghisSpawnChance.GetValue()
      If ShipToCheck.GetRef() != None
        Self.RegisterForDistanceLessThanEvent(PlayerShip as ScriptObject, ShipToCheck as ScriptObject, 2000.0, 0)
      Else
        Self.StartTimer(FallbackTimer, iTimerID)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.SpawnGenghisShip()
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID
    Self.SpawnGenghisShip()
  EndIf
EndEvent

Function SpawnGenghisShip()
  Utility.Wait(TimeToWait)
  MS02_Genghis_SE_ID.SetValue(SE_ID)
  SE_Player_FAB18c.Start()
EndFunction
