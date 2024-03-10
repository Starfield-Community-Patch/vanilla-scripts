ScriptName DefaultAliasOnSit Extends DefaultAlias
{ Set a stage when the actor in this alias sits in the specified furniture. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  ReferenceAlias Property SitTarget Auto Const
  { When an actor sits in/on the furniture in this alias, set the stage }
  Bool Property AllowDuringCombat = False Auto Const
  { Default=False. If true, do not set a stage if the sitting actor is in combat. }
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to display if AllowDuringCombat=False, and the player is the sitting actor, and they sit while in combat. }
EndGroup


;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  If akFurniture == SitTarget.GetRef()
    If AllowDuringCombat || !Self.GetActorRef().IsInCombat()
      defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Self.GetRef(), Self.TryToGetCurrentLocation(), None)
      Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
    ElseIf Self.GetRef() == Game.GetPlayer() as ObjectReference
      NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
EndEvent
