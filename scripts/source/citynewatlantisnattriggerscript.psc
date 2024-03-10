ScriptName CityNewAtlantisNATTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property NATTriggerMessage Auto Const
Quest Property NATControlQuest Auto Const mandatory
Scene Property NATTransitScene Auto Const mandatory
GlobalVariable Property NATDestinationGlobal Auto
Message Property CityNewAtlantisNATMessage_Disallowed_Combat Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event Scene.OnEnd(Scene akSource)
  Self.gotoState("Normal")
EndEvent

;-- State -------------------------------------------
State Busy

  Event OnBeginState(String asOldState)
    Self.BlockActivation(True, True)
    Self.RegisterForRemoteEvent(NATTransitScene as ScriptObject, "OnEnd")
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Normal

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.gotoState("Busy")
      Bool disallowed_Combat = Game.AreHostileActorsNear() || Game.IsGuardPursuingPlayer()
      If disallowed_Combat
        CityNewAtlantisNATMessage_Disallowed_Combat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Self.gotoState("Normal")
        Return 
      EndIf
      Self.SetOpen(True)
      Utility.Wait(0.129999995)
      Int iButton = 0
      iButton = NATTriggerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If iButton == -1
        Self.gotoState("Normal")
      ElseIf iButton == 0
        NATDestinationGlobal.SetValue(0.0)
        NATTransitScene.Start()
      ElseIf iButton == 1
        NATDestinationGlobal.SetValue(1.0)
        NATTransitScene.Start()
      ElseIf iButton == 2
        NATDestinationGlobal.SetValue(2.0)
        NATTransitScene.Start()
      ElseIf iButton == 3
        NATDestinationGlobal.SetValue(3.0)
        NATTransitScene.Start()
      EndIf
    EndIf
  EndEvent

  Event OnBeginState(String asOldState)
    Self.BlockActivation(False, False)
    Self.UnRegisterForRemoteEvent(NATTransitScene as ScriptObject, "OnEnd")
  EndEvent
EndState
