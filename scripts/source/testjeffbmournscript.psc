ScriptName TestJeffBMournScript Extends Actor conditional

;-- Variables ---------------------------------------
Actor myParent
Actor player

;-- Properties --------------------------------------
Bool Property isParentDead = False Auto conditional
Bool Property amParent = False Auto
Keyword Property myKeyword Auto

;-- Functions ---------------------------------------

Event OnLoad()
  If amParent == False
    myParent = Self.getLinkedRef(myKeyword) as Actor
    Self.RegisterForRemoteEvent(myParent as ScriptObject, "OnDeath")
  EndIf
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akActionRef)
  isParentDead = True
  Self.stopcombat()
  Self.EvaluatePackage(False)
EndEvent
