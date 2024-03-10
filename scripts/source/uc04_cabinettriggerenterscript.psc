ScriptName UC04_CabinetTriggerEnterScript Extends DefaultAliasOnTriggerEnter

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to throw if the player attempts to enter this trigger during combat }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If !Game.GetPlayer().IsInCombat()
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  Else
    NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If DeleteWhenTriggeredSuccessfully as Bool && LastRefToDoThingWith
    Self.TryToDelete()
  EndIf
EndFunction
