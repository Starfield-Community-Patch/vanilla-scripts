ScriptName DefaultDisableHavokOnLoad Extends ObjectReference default
{ Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab() }

;-- Variables ---------------------------------------
Bool bHasChangedContainers

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property HavokOnHit = False Auto Const
  { Start Havok Sim when hit? DEFAULT: False }
  Bool Property HavokOnActivate = False Auto Const
  { Start Havok Sim when activated? DEFAULT: False }
  Bool Property HavokOnZKey = False Auto Const
  { Start Havok Sim when grabbed by player? DEFAULT: False }
  Keyword Property LinkHavokPartner Auto Const
  { Link with this keyword and that ref will also sim with myself }
  Bool Property BeenSimmed = False Auto hidden
  { Prevent an object that has been havok'd in-game from going static }
  Float Property HavokImpulseMagnitude = 0.07 Auto Const
  { havok impulse to apply when released to havok sim }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = False, Set to True if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  bHasChangedContainers = True
  BeenSimmed = True
EndEvent

Event onLoad()
  If !HavokOnHit && !HavokOnActivate && !HavokOnZKey && !LinkHavokPartner
    
  EndIf
  If BeenSimmed == False && Self.Is3DLoaded()
    Self.setMotionType(Self.Motion_Keyframed, True)
    If !bHasChangedContainers
      Self.MoveToMyEditorLocation()
    EndIf
    If HavokOnHit
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    EndIf
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
  ObjectReference myLink = Self.getLinkedRef(LinkHavokPartner)
  If myLink != None
    DefaultDisableHavokOnLoad linkScript = myLink as DefaultDisableHavokOnLoad
    If linkScript as Bool && linkScript.BeenSimmed == False
      linkScript.ReleaseToHavok()
    EndIf
  EndIf
  Self.setMotionType(Self.Motion_Dynamic, True)
  Self.ApplyHavokImpulse(0.0, 0.0, 1.0, HavokImpulseMagnitude)
EndFunction
