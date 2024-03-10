ScriptName DefaultMultiStateActivator Extends ObjectReference conditional default
{ Generic script for managing and maintaining the animation state of activators. }

;-- Structs -----------------------------------------
Struct AnimationStateDatum
  String StateName
  { The name of this animation state. This is the name expected by SetAnimationState. }
  String StateJumpAnim01
  { Animation to snap to this state. }
  String StateJumpAnim02
  { Animation to snap to this state. Played following StateJumpAnim01. }
  String StateStartAnim01
  { Animation to transition to the state. If empty, StateJumpAnim01, if any, will be used instead. }
  String StateStartAnim02
  { Animation to transition to the state. If empty, StateJumpAnim02, if any, will be used instead. }
  Bool EnableOverrideDisplayName
  { If True, use OverrideDisplayName. }
  Message OverrideDisplayName
  { If EnableOverrideDisplayName, change the display name to this. }
  Bool EnableOverrideActivateText
  { If True, use OverrideActivateText. }
  Message OverrideActivateText
  { If EnableOverrideActivateText, change the activate message to this. }
  Bool EnableBlockActivation
  { If True, use BlockActivation & BlockActivationHideText. }
  Bool BlockActivation
  { If EnableBlockActivation, set Block Activation to this. }
  Bool BlockActivationHideText
  { If EnableBlockActivation, set Block Activation's Hide Text to this. }
EndStruct


;-- Variables ---------------------------------------
Int currentAnimatedStateIndex = 0

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard SetAnimationStateGuard

;-- Properties --------------------------------------
Group Base_Properties
  defaultmultistateactivator:animationstatedatum[] Property AnimationStateData Auto Const mandatory
  { A list of the object's animation states. }
EndGroup

Group Reference_Properties
  String Property StartStateName = "" Auto Const
  { The StateName of the animation state to start in. If "" (the default), this defaults to AnimationState[0]. }
EndGroup

Int Property CurrentStateIndex = 0 Auto conditional hidden

;-- Functions ---------------------------------------

Function SetAnimationState(String newStateName, Bool shouldUseJumpAnims)
  Self.GoToState("Main")
  Guard SetAnimationStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int newStateIndex = AnimationStateData.findstruct("StateName", newStateName, 0)
    If newStateIndex < 0
      
    Else
      Self.Private_SetAnimationStateIndex(newStateIndex, shouldUseJumpAnims)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Private_SetAnimationStateIndex(Int newStateIndex, Bool shouldUseJumpAnims)
  Int oldStateIndex = CurrentStateIndex
  CurrentStateIndex = newStateIndex
  defaultmultistateactivator:animationstatedatum currentStateData = AnimationStateData[CurrentStateIndex]
  If Self.Is3DLoaded()
    currentAnimatedStateIndex = CurrentStateIndex
    If !shouldUseJumpAnims && currentStateData.StateStartAnim01 != ""
      Self.PlayAnimation(currentStateData.StateStartAnim01)
    ElseIf currentStateData.StateJumpAnim01 != ""
      Self.PlayAnimation(currentStateData.StateJumpAnim01)
    EndIf
    If !shouldUseJumpAnims && currentStateData.StateStartAnim02 != ""
      Self.PlayAnimation(currentStateData.StateStartAnim02)
    ElseIf currentStateData.StateJumpAnim02 != ""
      Self.PlayAnimation(currentStateData.StateJumpAnim02)
    EndIf
  EndIf
  If currentStateData.EnableOverrideDisplayName
    Self.SetOverrideName(currentStateData.OverrideDisplayName)
  EndIf
  If currentStateData.EnableOverrideActivateText
    Self.SetActivateTextOverride(currentStateData.OverrideActivateText)
  EndIf
  If currentStateData.EnableBlockActivation
    Self.BlockActivation(currentStateData.BlockActivation, currentStateData.BlockActivationHideText)
  EndIf
  Var[] argsEvent = new Var[4]
  argsEvent[0] = oldStateIndex as Var
  argsEvent[1] = AnimationStateData[oldStateIndex].StateName as Var
  argsEvent[2] = newStateIndex as Var
  argsEvent[3] = AnimationStateData[newStateIndex].StateName as Var
  Self.SendCustomEvent("defaultmultistateactivator_DefaultMultiStateActivator_StateChanged", argsEvent)
EndFunction

String Function GetCurrentStateName()
  Guard SetAnimationStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Return AnimationStateData[CurrentStateIndex].StateName
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

;-- State -------------------------------------------
Auto State Initial

  Event OnLoad()
    Self.GoToState("Main")
    If StartStateName == ""
      Self.SetAnimationState(AnimationStateData[0].StateName, False)
    Else
      Self.SetAnimationState(StartStateName, False)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State Main

  Event OnLoad()
    Guard SetAnimationStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Self.Private_SetAnimationStateIndex(CurrentStateIndex, True)
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndEvent
EndState
