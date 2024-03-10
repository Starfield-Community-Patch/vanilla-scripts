ScriptName DefaultReleaseToHavokScript Extends ObjectReference default
{ Releases an object to Havok OnHit or OnActivate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  Bool Property HavokOnHit = True Auto Const
  { Default: TRUE. Should we release the object to Havok when it's hit? }
  Bool Property HavokOnActivate = True Auto Const
  { Default: TRUE. Should we release the object to Havok when it's activated? }
  Bool Property ReleaseAllLinkedHavokPartners = True Auto Const
  { Default: TRUE.
	 If True, release all objects linked to or from this object with LinkHavokPartner to Havok. Assumes this object is part of a simple chain; branching is NOT supported.
	 If False, release only objects linked from this object with LinkHavokPartner to Havok. }
  Keyword Property LinkHavokPartner Auto Const
  { The chain of objects linked with this keyword will be released to Havok when this object is released. }
EndGroup


;-- Functions ---------------------------------------

Function ReleaseToHavok()
  ; Empty function
EndFunction

;-- State -------------------------------------------
State Released
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference triggerRef)
    If HavokOnActivate
      Self.ReleaseToHavok()
    EndIf
  EndEvent

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
    If HavokOnHit
      Self.ReleaseToHavok()
    EndIf
  EndEvent

  Function ReleaseToHavok()
    Self.GoToState("Released")
    ObjectReference current = Self as ObjectReference
    If ReleaseAllLinkedHavokPartners
      ObjectReference[] currentLinkChain = new ObjectReference[1]
      currentLinkChain[0] = current
      ObjectReference[] currentParents = Self.GetRefsLinkedToMe(LinkHavokPartner, None)
      While currentParents.Length > 0 && currentLinkChain.find(currentParents[0], 0) < 0
        current = currentParents[0]
        currentLinkChain.add(current, 1)
        currentParents = current.GetRefsLinkedToMe(LinkHavokPartner, None)
      EndWhile
    EndIf
    current.SetMotionType(Self.Motion_Dynamic, True)
    ObjectReference[] myLinkChain = current.GetLinkedRefChain(LinkHavokPartner, 100)
    Int I = 0
    While I < myLinkChain.Length
      current = (myLinkChain[I] as DefaultReleaseToHavokScript) as ObjectReference
      If current != None
        current.SetMotionType(Self.Motion_Dynamic, True)
      EndIf
      I += 1
    EndWhile
  EndFunction

  Event OnLoad()
    If HavokOnHit
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    ElseIf !HavokOnActivate
      
    EndIf
  EndEvent
EndState
