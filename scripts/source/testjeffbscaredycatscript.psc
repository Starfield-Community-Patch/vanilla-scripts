ScriptName TestJeffBScaredycatScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] LinkedRefs
Bool doOnce = False
ObjectReference myActor
ObjectReference player

;-- Properties --------------------------------------
wwiseevent Property mySoundEvent Auto Const
ImageSpaceModifier Property myImageSpace Auto Const
Keyword Property LinkCustom01 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myActor = Self.getLinkedRef(LinkCustom01)
  player = Game.GetPlayer() as ObjectReference
  LinkedRefs = Self.getLinkedRefChain(LinkCustom01, 100)
  Self.RegisterForHitEvent(myActor as ScriptObject, player as ScriptObject, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == player && doOnce == False
    doOnce = True
    Int instanceID = mySoundEvent.play(Self.getLinkedRef(None), None, None)
    myImageSpace.Apply(1.0)
    myActor.EnableNoWait(False)
    Utility.wait(0.5)
    myImageSpace.Remove()
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akTarget == myActor && akAggressor == player
    myActor.Disable(False)
    Int I = 1
    While I <= LinkedRefs.Length
      (LinkedRefs[I] as Actor).SetGhost(True)
      LinkedRefs[I].EnableNoWait(False)
      I += 1
    EndWhile
  Else
    Self.RegisterForHitEvent(myActor as ScriptObject, player as ScriptObject, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent
