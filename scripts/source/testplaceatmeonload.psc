ScriptName TestPlaceAtMeOnLoad Extends ObjectReference
{ using for testing }

;-- Variables ---------------------------------------
Bool created = False

;-- Properties --------------------------------------
Form Property CreatedForm Auto Const mandatory
Keyword Property LinkKeyword Auto Const
Float Property CreateTimer = 5.0 Auto Const
{ how long to wait before creating }

;-- Functions ---------------------------------------

Event OnLoad()
  If created == False
    created = True
    Self.StartTimer(CreateTimer, 0)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  ObjectReference newRef = Self.PlaceAtMe(CreatedForm, 1, False, False, True, None, None, True)
  ObjectReference linkedRef = Self.GetLinkedRef(LinkKeyword)
  If linkedRef
    newRef.SetLinkedRef(linkedRef, LinkKeyword, True)
  EndIf
EndEvent
