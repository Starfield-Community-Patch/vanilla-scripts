ScriptName MQ204BasementNPCTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool CompanionMoved
Bool CoraMoved
Bool MatteoMoved
Bool VascoMoved
Bool WalterMoved

;-- Properties --------------------------------------
Int Property PreReqStage = 110 Auto Const
Int Property PostStage = 127 Auto Const
ReferenceAlias Property Noel Auto Const mandatory
ReferenceAlias Property CompanionAtLodge Auto Const mandatory
ReferenceAlias Property WalterStroud Auto Const mandatory
ReferenceAlias Property Vasco Auto Const mandatory
ReferenceAlias Property MatteoKhatri Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
ObjectReference Property MQ204_NoelWellEscort_Marker Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Walter02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Companion02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Vasco02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Matteo02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Cora02 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(PreReqStage) && !myQuest.GetStageDone(PostStage)
    If akActionRef == Noel.GetActorRef() as ObjectReference
      
    ElseIf (akActionRef == CompanionAtLodge.GetActorRef() as ObjectReference) && !CompanionMoved
      CompanionMoved = True
      akActionRef.moveto(MQ204_RunMarker_Companion02, 0.0, 0.0, 0.0, True, False)
    ElseIf (akActionRef == WalterStroud.GetActorRef() as ObjectReference) && !WalterMoved
      WalterMoved = True
      akActionRef.moveto(MQ204_RunMarker_Walter02, 0.0, 0.0, 0.0, True, False)
    ElseIf (akActionRef == Vasco.GetActorRef() as ObjectReference) && !VascoMoved
      VascoMoved = True
      akActionRef.moveto(MQ204_RunMarker_Vasco02, 0.0, 0.0, 0.0, True, False)
    ElseIf (akActionRef == MatteoKhatri.GetActorRef() as ObjectReference) && !MatteoMoved
      MatteoMoved = True
      akActionRef.moveto(MQ204_RunMarker_Matteo02, 0.0, 0.0, 0.0, True, False)
    ElseIf (akActionRef == CoraCoe.GetActorRef() as ObjectReference) && !CoraMoved
      CoraMoved = True
      akActionRef.moveto(MQ204_RunMarker_Cora02, 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
EndEvent
