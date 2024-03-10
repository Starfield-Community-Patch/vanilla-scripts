ScriptName TestZachDungeon Extends ObjectReference

;-- Variables ---------------------------------------
Int CurrentLength
Int TotalLength

;-- Properties --------------------------------------
ObjectReference[] Property EntranceDoors Auto
ObjectReference[] Property StartMarkers Auto

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnInit()
  Self.Reinit()
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  Int r = Utility.RandomInt(0, CurrentLength - 1)
  Game.GetPlayer().moveto(StartMarkers[r], 0.0, 0.0, 0.0, True, False)
  ObjectReference h = StartMarkers[r]
  StartMarkers.remove(r, 1)
  StartMarkers.add(h, 1)
  CurrentLength -= 1
  If CurrentLength == 0
    Self.Reinit()
  EndIf
EndEvent

Function Reinit()
  Int I = 0
  While I < EntranceDoors.Length
    Self.RegisterForRemoteEvent(EntranceDoors[I] as ScriptObject, "OnActivate")
    I += 1
  EndWhile
  TotalLength = StartMarkers.Length
  CurrentLength = StartMarkers.Length
EndFunction
