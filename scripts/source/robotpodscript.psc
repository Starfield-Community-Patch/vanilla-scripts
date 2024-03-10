ScriptName RobotPodScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property isInPod = True Auto conditional
{ Set to FALSE to have Robot start on its patrol. TRUE to start inside of pod }
Keyword Property DMP_LinkRobotPod Auto Const mandatory
{ Robot Pod Link Keyword }

;-- Functions ---------------------------------------

Function SendRobotToPod()
  If Self.IsDead() == False
    ObjectReference myPod = Self.GetLinkedRef(DMP_LinkRobotPod)
    If myPod
      isInPod = True
      Self.EvaluatePackage(False)
    Else
      Self.SetUnconscious(True)
    EndIf
  EndIf
EndFunction

Function WakeRobotFromPod()
  If Self.IsDead() == False
    Self.SetUnconscious(False)
    ObjectReference myPod = Self.GetLinkedRef(DMP_LinkRobotPod)
    If myPod
      isInPod = False
      Self.EvaluatePackage(False)
    EndIf
  EndIf
EndFunction

Event OnSit(ObjectReference akFurniture)
  If akFurniture == Self.GetLinkedRef(DMP_LinkRobotPod)
    Self.SetUnconscious(True)
  EndIf
EndEvent

Bool Function HasPod()
  Return Self.GetLinkedRef(DMP_LinkRobotPod) != None
EndFunction
