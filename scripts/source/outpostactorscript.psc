ScriptName OutpostActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property AssignAsCrewOnCreation = False Auto Const
{ if true, actor will be assigned as crew when it is created }
ActorValue Property CrewReassignDisabled Auto Const
{ optional - if exists, will be set on this actor when it is created }
ActorValue Property CrewSlotCost Auto Const
{ optional - if exists, will be set to CrewSlotCostValue on this actor when it is created }
Int Property CrewSlotCostValue = -1 Auto Const
Bool Property SetEssentialOnCreation = True Auto Const
Bool Property SetNoBleedoutRecoveryOnCreation = True Auto Const

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  ObjectReference myWorkshop = Self.GetWorkshop()
  Self.SetEssential(SetEssentialOnCreation)
  Self.SetNoBleedoutRecovery(SetNoBleedoutRecoveryOnCreation)
  If CrewReassignDisabled
    Self.SetValue(CrewReassignDisabled, 1.0)
  EndIf
  If CrewSlotCost
    Self.ModValue(CrewSlotCost, CrewSlotCostValue as Float)
  EndIf
  Self.CheckAssignAsCrew(myWorkshop, True)
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  Self.CheckAssignAsCrew(akReference, False)
EndEvent

Function CheckAssignAsCrew(ObjectReference myWorkshop, Bool bAssign)
  If AssignAsCrewOnCreation
    If myWorkshop
      If bAssign
        myWorkshop.AssignCrew(Self as Actor)
      Else
        myWorkshop.UnassignCrew(Self as Actor)
      EndIf
    EndIf
  EndIf
EndFunction

Function testGetAllCrew()
  ObjectReference myWorkshop = Self.GetWorkshop()
  If myWorkshop
    
  EndIf
EndFunction
