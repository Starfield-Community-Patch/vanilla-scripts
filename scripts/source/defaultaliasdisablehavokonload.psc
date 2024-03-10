ScriptName DefaultAliasDisableHavokOnLoad Extends ReferenceAlias default
{ Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property HavokOnHit Auto Const
  { Start Havok Sim when hit? DEFAULT: FALSE }
  Bool Property HavokOnActivate Auto Const
  { Start Havok Sim when activated? DEFAULT: FALSE }
  Bool Property HavokOnZKey Auto Const
  { Start Havok Sim when grabbed by player? DEFAULT: FALSE }
  Keyword Property LinkHavokPartner Auto Const
  { Link with this keyword and that ref will also sim with myself }
EndGroup

Bool Property BeenSimmed Auto hidden
{ Prevent an object that has been havok'd in-game from going static }

;-- Functions ---------------------------------------

Event onLoad()
  ObjectReference ref = Self.GetReference()
  If BeenSimmed == False && ref.Is3DLoaded()
    ref.SetMotionType(ref.Motion_Keyframed, True)
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event onUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event onActivate(ObjectReference triggerRef)
  If HavokOnActivate == True && BeenSimmed == False
    Self.ReleaseToHavok()
  EndIf
EndEvent

Event onHit(ObjectReference akTarget, ObjectReference var1, Form var2, Projectile var3, Bool var4, Bool var5, Bool var6, Bool var7, String asMaterialName)
  If HavokOnHit == True && BeenSimmed == False
    Self.ReleaseToHavok()
  EndIf
EndEvent

Event onGrab()
  If HavokOnZKey == True && BeenSimmed == False
    Self.ReleaseToHavok()
  EndIf
EndEvent

Function ReleaseToHavok()
  BeenSimmed = True
  ObjectReference ref = Self.GetReference()
  ObjectReference myLink = ref.getLinkedRef(LinkHavokPartner)
  If myLink != None
    defaultdisablehavokonload linkScript = myLink as defaultdisablehavokonload
    If linkScript as Bool && linkScript.BeenSimmed == False
      linkScript.ReleaseToHavok()
    EndIf
  EndIf
  ref.SetMotionType(ref.Motion_Dynamic, True)
  ref.ApplyHavokImpulse(0.0, 0.0, 1.0, 5.0)
EndFunction
