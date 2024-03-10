ScriptName TestOpenStarbornTempleScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property TempleWall Auto Const mandatory
ObjectReference Property TempleWallMoveToMarker Auto Const mandatory
ObjectReference Property TempleWallOpenSoundMarker Auto Const mandatory
wwiseevent Property sOpenWallEvent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  TempleWall.TranslateToRef(TempleWallMoveToMarker, 4.0, 0.0)
  sOpenWallEvent.Play(TempleWallOpenSoundMarker, None, None)
EndEvent
