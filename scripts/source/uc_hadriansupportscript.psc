ScriptName UC_HadrianSupportScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property TeleportAfterUC05 Auto Const
  { If true, teleport this NPC back to Mars after UC05 }
  Bool Property TeleportAfterUC08 Auto Const
  { If true, teleport this NPC back to Mars after UC08 }
  Bool Property TeleportAfterUC09 Auto Const
  { If true, teleport this NPC back to Mars after UC09 }
  Bool Property DisableOnECPickup Auto Const
  { If true, we'll disable this script once the NPC has been picked up via the EC system }
  Bool Property SetStageOnRHQQuest Auto Const
  { When this NPC unloads post-UC09, should we set the stage on the RedDevilsHQ quest to set up the intro scene? }
  Bool Property SetAVOnLoad = False Auto Const
  { If there's a custom AV you'd like set on this NPC on load, set to true }
  ActorValue Property AVToSet Auto Const
  { If you want to set an AV on this NPC on load, set that here }
  Float Property NewValueToSet Auto Const
  { What AVToSet gets set to on load }
  ObjectReference Property UC09SecondayTeleportDestination Auto Const
  { Marker to which we'll move Hadrian after UC09 if a marker is added to this }
EndGroup

Group Required_Properties
  ObjectReference Property TeleportDestination Auto Const mandatory
  { Marker to which we'll move Hadrian once this stage is set }
  Cell Property POI064RedDevilHq01 Auto Const mandatory
  { Destination cell for Hadrian's teleport }
EndGroup

Group Teleport_Data
  Quest Property UC05 Auto Const mandatory
  { Quest to check for a Hadrian teleport }
  Quest Property UC08 Auto Const mandatory
  { Quest to check for end-questline teleport }
  Quest Property UC09 Auto Const mandatory
  { Quest to check for end-questline teleport }
  Quest Property DialogueRedDevilsHQ Auto Const mandatory
  { Red Devils location quest }
  Quest Property CREW_EliteCrew_Hadrian Auto Const mandatory
  { Used to check if Hadrian's been picked up as crew }
  Int Property UC05TeleportPrereqStage = 985 Auto Const
  { Check to see if this stage is complete on UC05. If so, teleport Hadrian back to Mars as soon as she unloads }
  Int Property PostUC05TeleportShutdownStage = 171 Auto Const
  { If this stage is stage on UC08, ignore trying to teleport Hadrian back to Mars. }
  Int Property UC08TeleportPrereqStage = 1000 Auto Const
  { If this stage has been set on UC08, when Hadrian next unloads, teleport her to Mars }
  Int Property PostUC08TeleportShutdownStage = 200 Auto Const
  { If this stage is stage on UC09, ignore trying to teleport Hadrian back to Mars. }
  Int Property UC09TeleportPrereqStage = 500 Auto Const
  { If this stage has been set on UC09, when Hadrian next unloads, teleport her to Mars }
  Int Property PostUC09TeleportShutdownStage = 50 Auto Const
  { If this stage is stage on Hadrian's EC behavior, turn this system off permanently. }
  Int Property RHQStagetoSet = 500 Auto Const
  { Stage to set on the Red Devil's HQ quest when this NPC unloads post UC09 AND SetStageOnRHQQuest is true }
EndGroup


;-- Functions ---------------------------------------

Event OnUnload()
  If Self.GetParentCell() != POI064RedDevilHq01
    If !DisableOnECPickup || DisableOnECPickup && !CREW_EliteCrew_Hadrian.GetStageDone(50)
      If TeleportAfterUC05 && UC05.GetStageDone(UC05TeleportPrereqStage) && !UC08.GetStageDone(PostUC05TeleportShutdownStage)
        Self.MoveTo(TeleportDestination, 0.0, 0.0, 0.0, True, False)
      ElseIf TeleportAfterUC08 && UC08.GetStageDone(UC08TeleportPrereqStage) && !UC09.GetStageDone(PostUC08TeleportShutdownStage)
        Self.MoveTo(TeleportDestination, 0.0, 0.0, 0.0, True, False)
      ElseIf TeleportAfterUC09 && UC09.GetStageDone(UC09TeleportPrereqStage)
        If UC09SecondayTeleportDestination != None
          Self.MoveTo(UC09SecondayTeleportDestination, 0.0, 0.0, 0.0, True, False)
        Else
          Self.MoveTo(TeleportDestination, 0.0, 0.0, 0.0, True, False)
        EndIf
        If SetStageOnRHQQuest
          DialogueRedDevilsHQ.SetStage(RHQStagetoSet)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent

Event OnLoad()
  If SetAVOnLoad
    If Self.GetValue(AVToSet) != NewValueToSet
      Self.SetValue(AVToSet, NewValueToSet)
    EndIf
  EndIf
EndEvent
