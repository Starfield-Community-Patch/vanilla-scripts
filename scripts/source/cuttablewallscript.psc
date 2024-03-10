ScriptName CuttableWallScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ Link to the Bolts, a LinkRefChain }
Keyword Property LinkCustom02 Auto Const mandatory
{ Link to the panel }
wwiseevent Property DRS_Cuttable_IndIntRmSmWallMid_PlugA03_PlugCut Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnDestroyed(ObjectReference akSender, ObjectReference akDestroyer)
  DRS_Cuttable_IndIntRmSmWallMid_PlugA03_PlugCut.Play(akSender, None, None)
  ObjectReference[] Bolts = Self.GetLinkedRefChain(LinkCustom01, 100)
  Bool allBoltsDestroyed = True
  Int index = 0
  While index < Bolts.Length
    If !Bolts[index].isDestroyed()
      allBoltsDestroyed = False
    EndIf
    index += 1
  EndWhile
  If allBoltsDestroyed
    Self.ReleasePanel()
  EndIf
EndEvent

Function ReleasePanel()
  Self.GetLinkedRef(LinkCustom02).SetOpen(True)
EndFunction

Function IntializeCuttableWall()
  ObjectReference[] Bolts = Self.GetLinkedRefChain(LinkCustom01, 100)
  Int index = 0
  While index < Bolts.Length
    Bolts[index].ClearDestruction()
    Self.RegisterForRemoteEvent(Bolts[index] as ScriptObject, "OnDestroyed")
    index += 1
  EndWhile
  Self.GetLinkedRef(LinkCustom02).SetOpen(False)
  Self.GoToState("Done")
EndFunction

Event OnReset()
  Self.GoToState("Initial")
  If Game.GetPlayer().GetParentCell() == Self.GetParentCell()
    Self.IntializeCuttableWall()
  EndIf
EndEvent

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnCellLoad()
    Self.IntializeCuttableWall()
  EndEvent
EndState
