ScriptName RI01_QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer InterviewLayer

;-- Properties --------------------------------------
ReferenceAlias Property NeonTerraBrewEmployee Auto Const mandatory
ReferenceAlias Property NeonTerraBrewEmployeeFurniture Auto Const mandatory
ReferenceAlias Property TerraBrewCoffeeOrder Auto Const mandatory
MiscObject Property RI01_TerraBrewOrder Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
ActorBase Property FC_Neon_TerraBrewEmployee Auto Const mandatory
GlobalVariable Property TrueGlobal Auto Const mandatory
Int Property iPickUpCoffeeStage = 500 Auto Const

;-- Functions ---------------------------------------

Event OnStageSet(Int auiStageID, Int auiItemID)
  If TrueGlobal.GetValue() == 0.0
    If auiStageID == iPickUpCoffeeStage
      Actor EmployeeRef = NeonTerraBrewEmployee.GetActorRef()
      If EmployeeRef.IsDead()
        EmployeeRef.Resurrect()
        EmployeeRef.MoveTo(NeonTerraBrewEmployeeFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
      EndIf
    EndIf
  ElseIf auiStageID == iPickUpCoffeeStage
    Actor employeeref = NeonTerraBrewEmployee.GetActorRef()
    If employeeref.IsDead()
      employeeref.Disable(False)
      NeonTerraBrewEmployee.Clear()
      NeonTerraBrewEmployeeFurniture.GetRef().PlaceAtMe(FC_Neon_TerraBrewEmployee as Form, 1, False, False, True, None, NeonTerraBrewEmployee as Alias, True)
      NeonTerraBrewEmployee.GetRef().SetLinkedRef(NeonTerraBrewEmployeeFurniture.GetRef(), None, True)
    EndIf
  EndIf
EndEvent

Function FreezeControls()
  Game.GetPlayer().StopCombatAlarm()
  InterviewLayer = inputenablelayer.Create()
  InterviewLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
EndFunction

Function UnfreezeControls()
  InterviewLayer = None
EndFunction
