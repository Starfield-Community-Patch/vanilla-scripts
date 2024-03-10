ScriptName GenericSwitchScript Extends ObjectReference
{ Script for controlling the state and color of generic switches. }

;-- Variables ---------------------------------------
Bool initialized

;-- Properties --------------------------------------
Group OptionalProperties
  String Property CurrentState = "On" Auto
  { DEFAULT=On. The switch's current state.
	Available states: Off, On, Pulse, PulseFast, Flicker }
  String Property CurrentColor = "Green" Auto
  { DEFAULT=Green. The switch's current color.
	Available colors: Green, Red, Blue, Orange, Yellow, White, Violet. }
  Keyword Property ParentSwitchLink Auto Const
  { DEFAULT=None. If not none, if this switch is linked to another switch with this keyword, register for events on that switch. }
EndGroup

Bool Property HasParentSwitch Auto hidden
Bool Property IsParentSwitch Auto hidden

;-- Functions ---------------------------------------

Event OnCellLoad()
  If !initialized
    initialized = True
    If ParentSwitchLink != None
      GenericSwitchScript parentSwitch = Self.GetLinkedRef(ParentSwitchLink) as GenericSwitchScript
      If parentSwitch != None
        HasParentSwitch = True
        parentSwitch.IsParentSwitch = True
        Self.RegisterForCustomEvent(parentSwitch as ScriptObject, "genericswitchscript_SetColorEvent")
        Self.RegisterForCustomEvent(parentSwitch as ScriptObject, "genericswitchscript_SetStateEvent")
        Self.SetColor(parentSwitch.CurrentColor)
        Self.SetState(parentSwitch.CurrentState)
      EndIf
    EndIf
  EndIf
  If !HasParentSwitch
    Self.SetColor(CurrentColor)
    Self.SetState(CurrentState)
  EndIf
EndEvent

Event GenericSwitchScript.SetColorEvent(GenericSwitchScript akSender, Var[] akArgs)
  Self.SetColor(akArgs[0] as String)
EndEvent

Function SetColor(String newColor)
  If IsParentSwitch
    Var[] akArgs = new Var[1]
    akArgs[0] = newColor as Var
    Self.SendCustomEvent("genericswitchscript_SetColorEvent", akArgs)
  EndIf
  If newColor == "Green" || newColor == "Red" || newColor == "Blue" || newColor == "Orange" || newColor == "Yellow" || newColor == "White" || newColor == "Violet"
    CurrentColor = newColor
    Self.PlayAnimationIfLoaded("TurnColor" + newColor)
  EndIf
EndFunction

Event GenericSwitchScript.SetStateEvent(GenericSwitchScript akSender, Var[] akArgs)
  Self.SetState(akArgs[0] as String)
EndEvent

Function SetState(String newState)
  If IsParentSwitch
    Var[] akArgs = new Var[1]
    akArgs[0] = newState as Var
    Self.SendCustomEvent("genericswitchscript_SetStateEvent", akArgs)
  EndIf
  If newState == "Off"
    CurrentState = newState
    Self.PlayAnimationIfLoaded("TurnOffFull")
  ElseIf newState == "On"
    CurrentState = newState
    Self.PlayAnimationIfLoaded("TurnOnFull")
  ElseIf newState == "Pulse"
    CurrentState = newState
    Self.PlayAnimationIfLoaded("TurnOnPulse")
  ElseIf newState == "PulseFast"
    CurrentState = newState
    Self.PlayAnimationIfLoaded("TurnOnPulseFast")
  ElseIf newState == "Flicker"
    CurrentState = newState
    Self.PlayAnimationIfLoaded("TurnOnFlicker")
  EndIf
EndFunction

Function PlayAnimationIfLoaded(String animationToPlay)
  If Self.Is3DLoaded()
    Self.PlayAnimation(animationToPlay)
  EndIf
EndFunction
