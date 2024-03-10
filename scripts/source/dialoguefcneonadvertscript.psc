ScriptName DialogueFCNeonAdvertScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard sceneGuard

;-- Properties --------------------------------------
Scene[] Property AdvertScenes Auto Const
{ array of scenes we want to stop/start when the player is in Neon }
Location Property CityNeonLocation Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc == CityNeonLocation
    Self.UpdateScenes(False)
  ElseIf akNewLoc == CityNeonLocation
    Self.UpdateScenes(True)
  EndIf
EndEvent

Function UpdateScenes(Bool bStart)
  Guard sceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int I = 0
    While I < AdvertScenes.Length
      Scene theScene = AdvertScenes[I]
      If theScene
        If bStart
          theScene.Start()
        Else
          theScene.Stop()
        EndIf
      EndIf
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
