ScriptName RQ_TransportPerson_01_Script Extends RQ_TransportPersonScript

;-- Variables ---------------------------------------
Bool assignedAVs = False

;-- Properties --------------------------------------
Group TransportPerson_Properties
  ActorValue Property RQ_AV_TransportPerson_01_HabitatProblem Auto Const mandatory
  ActorValue Property RQ_AV_TransportPerson_01_ShipProblem Auto Const mandatory
  Int Property HabitatProblemLineCount = 8 Auto Const
  { The number of randomly selectable dialogue lines related to the Quest Giver's habitat problems. }
  Int Property ShipProblemLineCount = 8 Auto Const
  { The number of randomly selectable dialogue lines related to the Quest Giver's ship problems. }
EndGroup


;-- Functions ---------------------------------------

Function OnQuestGiverSet(ObjectReference akQuestGiver)
  If !assignedAVs
    assignedAVs = True
    akQuestGiver.SetValue(RQ_AV_TransportPerson_01_HabitatProblem, Utility.RandomInt(0, HabitatProblemLineCount - 1) as Float)
    akQuestGiver.SetValue(RQ_AV_TransportPerson_01_ShipProblem, Utility.RandomInt(0, ShipProblemLineCount - 1) as Float)
  EndIf
EndFunction
