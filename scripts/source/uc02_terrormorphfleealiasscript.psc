ScriptName UC02_TerrormorphFleeAliasScript Extends ReferenceAlias Const

;-- Variables ---------------------------------------
Int iCheckTimerID = 1 Const

;-- Properties --------------------------------------
Faction Property TerrormorphFaction Auto Const mandatory
{ Terrormorph faction }
RefCollectionAlias Property FleeingTerrormorph Auto Const mandatory
{ Collection for fleeing Terrormorphs }
Int Property CheckTimerLength Auto Const mandatory
{ How frequently we check to see if the Terrormorph is out of range of the target }
GlobalVariable Property UC02_TerrormorphFleeDistance Auto Const mandatory
{ Global used to know how far Terrormorphs need to flee from this alias }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Actor TriggerACT = akActionRef as Actor
  If TriggerACT as Bool && TriggerACT.IsInFaction(TerrormorphFaction)
    If FleeingTerrormorph.GetCount() <= 0
      Self.StartTimerCheck()
    EndIf
    FleeingTerrormorph.Addref(TriggerACT as ObjectReference)
    TriggerACT.EvaluatePackage(False)
  EndIf
EndEvent

Function StartTimerCheck()
  Self.StartTimer(CheckTimerLength as Float, iCheckTimerID)
EndFunction

Function CleanUpCollection()
  Int I = 0
  Int iCount = FleeingTerrormorph.GetCount()
  While I < iCount
    ObjectReference currMorph = FleeingTerrormorph.GetAt(I)
    If currMorph.GetDistance(Self.GetRef()) <= UC02_TerrormorphFleeDistance.GetValue()
      FleeingTerrormorph.RemoveRef(currMorph)
    EndIf
    I += 1
  EndWhile
  If FleeingTerrormorph.GetCount() > 0
    Self.StartTimerCheck()
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iCheckTimerID
    Self.CleanUpCollection()
  EndIf
EndEvent

Event OnUnload()
  Self.CancelTimer(iCheckTimerID)
  FleeingTerrormorph.RemoveAll()
EndEvent
