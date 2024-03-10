ScriptName FX:ExplosionOnAnimEvent Extends ObjectReference Const
{ Place an explosion on an animation event }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String[] Property sAnimEventList Auto Const mandatory
Explosion Property PlacedExplosion Auto Const mandatory

;-- Functions ---------------------------------------

Function PlaceExplosion(Explosion PlacedExplosionRef)
  Self.PlaceAtMe(PlacedExplosionRef as Form, 1, False, False, True, None, None, True)
EndFunction

Event OnLoad()
  If Self.Is3DLoaded()
    Int I = 0
    While I < sAnimEventList.Length
      Self.RegisterForAnimationEvent(Self as ObjectReference, sAnimEventList[I])
      I += 1
    EndWhile
  EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If sAnimEventList.find(asEventName, 0) < 0
    Return 
  Else
    Self.PlaceExplosion(PlacedExplosion)
  EndIf
EndEvent

Event OnUnLoad()
  Int I = 0
  While I < sAnimEventList.Length
    Self.UnRegisterForAnimationEvent(Self as ObjectReference, sAnimEventList[I])
    I += 1
  EndWhile
EndEvent
