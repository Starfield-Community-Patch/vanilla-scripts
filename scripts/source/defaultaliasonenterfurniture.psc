ScriptName DefaultAliasOnEnterFurniture Extends DefaultAlias
{ Set a stage when an actor sits in this furniture. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property AllowDuringCombat = False Auto Const
  { Default=False. If true, do not set a stage if the sitting actor is in combat. }
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to display if AllowDuringCombat=False, and the player is the sitting actor, and they sit while in combat. }
EndGroup


;-- Functions ---------------------------------------

Event OnEnterFurniture(Actor akActionRef)
  If AllowDuringCombat || !akActionRef.IsInCombat()
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef as ObjectReference, Self.TryToGetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  ElseIf akActionRef == Game.GetPlayer()
    NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent
