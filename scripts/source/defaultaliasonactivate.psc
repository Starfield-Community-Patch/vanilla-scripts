ScriptName DefaultAliasOnActivate Extends DefaultAlias default
{ Sets stage if a THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property ShouldDisableAfterSuccessfulActivation = False Auto Const
  { (Default: false) If true, disable after being successfully activated }
  Bool Property ShouldHideActivationAfterSuccessfulActivation = False Auto Const
  { (Default: false) If true, hide activation (button prompt) after being successfully activated }
  Bool Property AllowDuringCombat = True Auto Const
  { Default=true. If true, do not set a stage if the activator is in combat. }
  Message Property NotAllowedDuringCombat Auto Const
  { Message to display if AllowDuringCombat=False, and the player is the activator, and they sit while in combat. }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor ActorREF = akActionRef as Actor
  If AllowDuringCombat || (ActorREF as Bool && !ActorREF.IsInCombat())
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  ElseIf (akActionRef == Game.GetPlayer() as ObjectReference) && NotAllowedDuringCombat != None
    NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If ShouldDisableAfterSuccessfulActivation
    ObjectReference selfRef = Self.GetReference()
    selfRef.Disable(False)
  ElseIf ShouldHideActivationAfterSuccessfulActivation
    ObjectReference selfref = Self.GetReference()
    selfref.BlockActivation(True, True)
  EndIf
EndFunction
