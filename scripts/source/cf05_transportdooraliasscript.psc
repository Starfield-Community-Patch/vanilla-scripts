ScriptName CF05_TransportDoorAliasScript Extends ReferenceAlias
{ Script to display objectives to find keys for locked doors leading to the different sections of SY-920. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property KeyToCheck Auto Const mandatory
{ The key required to unlock the door. }
Int Property iHasKeyStage Auto Const mandatory
{ The stage to set when elevator is activated. }
Int Property iNoKeyStage Auto Const mandatory
{ The stage to set to display the objective to find the key. }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  If akActionRef == PlayerRef && PlayerRef.GetItemCount(KeyToCheck as Form) <= 0
    Self.GetOwningQuest().SetStage(iNoKeyStage)
  ElseIf akActionRef == PlayerRef
    Self.GetOwningQuest().SetStage(iHasKeyStage)
  EndIf
EndEvent
