ScriptName DefaultSceneStartOnEnterTrigger Extends DefaultRefOnTriggerEnter
{ Starts a scene when THIS reference's trigger is entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Scene Property SceneToStart Auto Const mandatory
  { Scene that we want to start }
  Bool Property DisableAfterStartingScene = True Auto Const
  { If true (default), disable THIS object after the scene starts }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If SceneToStart.IsPlaying() == False
    If SceneToStart.GetOwningQuest().IsRunning()
      SceneToStart.Start()
      If DisableAfterStartingScene
        Self.Disable(False)
      EndIf
      Parent.DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith, LastRefToDoThingWith)
    EndIf
  EndIf
EndFunction
