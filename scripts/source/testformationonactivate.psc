ScriptName TestFormationOnActivate Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property TestFormationGlobal Auto Const
Actor Property Leader Auto Const
Actor Property Follower01 Auto Const
Actor Property Follower02 Auto Const
Actor Property Follower03 Auto Const
Actor Property Follower04 Auto Const
Int Property GlobalSetValue = 1 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  TestFormationGlobal.SetValue(GlobalSetValue as Float)
  Leader.EvaluatePackage(False)
  Follower01.EvaluatePackage(False)
  Follower02.EvaluatePackage(False)
  Follower03.EvaluatePackage(False)
  Follower04.EvaluatePackage(False)
EndEvent
