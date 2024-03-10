ScriptName CF05_PlayerAliasScript Extends ReferenceAlias
{ This script handles the behavior of the player picking up items for this quest. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestStageProperties
  Int Property iUCIDStage = 1011 Auto Const
  Int Property iEnsignUniformStage = 1021 Auto Const
  Int Property iCommandBayKeyCardStage = 1101 Auto Const
  Int Property iEngineeringBayKeyCardStage = 1501 Auto Const
  Int Property iPilotUniformStage = 1711 Auto Const
  Int Property iDockingBayKeyCardStage = 1800 Auto Const
  Int Property iWearEnsignUniformObjective = 1030 Auto Const
  Int Property iTalkToSecurityGuardStage = 1040 Auto Const
  Int Property iWearPilotUniformObjective = 1720 Auto Const
  Int Property iWorePilotUniformStage = 1721 Auto Const
EndGroup

Key Property CF05_UCID_Elijah Auto Const mandatory
Key Property LC043_SY01CommandAccessKey Auto Const mandatory
Key Property LC043_SY02EngineeringAccessKey Auto Const mandatory
Key Property LC043_SY03DockingPortKey Auto Const mandatory
ReferenceAlias Property CF05_UCIDCard Auto Const mandatory
ReferenceAlias Property CF05_EnsignUniform Auto Const mandatory
ReferenceAlias Property CF05_CommandBayAccessCard Auto Const mandatory
ReferenceAlias Property CF05_PilotUniform Auto Const mandatory
Armor Property CF05_EnsignUniformArmor Auto Const mandatory
Armor Property CF05_EnsignUniformArmor02 Auto Const mandatory
Armor Property CF05_EnsignUniformArmor03 Auto Const mandatory
Armor Property CF05_Clothes_ScienceLabTec Auto Const mandatory
Armor Property CF05_PilotUniformArmor Auto Const mandatory
Faction Property LC043SYFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory
Keyword Property CF05_EnsignArmorKeyword_Disguise Auto Const mandatory
Quest Property LC043 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  If (akBaseObject == CF05_EnsignUniformArmor as Form) || (akBaseObject == CF05_PilotUniformArmor as Form) || (akBaseObject == CF05_EnsignUniformArmor02 as Form) || (akBaseObject == CF05_EnsignUniformArmor03 as Form) || (akBaseObject == CF05_Clothes_ScienceLabTec as Form)
    Actor PlayerRef = Game.GetPlayer()
    Quest MyQuest = Self.GetOwningQuest()
    If akBaseObject == CF05_EnsignUniformArmor as Form
      If MyQuest.IsObjectiveDisplayed(iWearEnsignUniformObjective)
        MyQuest.SetStage(iTalkToSecurityGuardStage)
      EndIf
    ElseIf akBaseObject == CF05_PilotUniformArmor as Form
      If MyQuest.IsObjectiveDisplayed(iWearPilotUniformObjective)
        MyQuest.SetStage(iWorePilotUniformStage)
      EndIf
    EndIf
    If !LC043.GetStageDone(150)
      PlayerRef.AddToFaction(LC043SY01Faction)
    EndIf
    If !LC043.GetStageDone(250)
      PlayerRef.AddToFaction(LC043SY02Faction)
    EndIf
    If !LC043.GetStageDone(350)
      PlayerRef.AddToFaction(LC043SY03Faction)
    EndIf
  EndIf
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
  If (akBaseObject == CF05_EnsignUniformArmor as Form) || (akBaseObject == CF05_PilotUniformArmor as Form) || (akBaseObject == CF05_EnsignUniformArmor02 as Form) || (akBaseObject == CF05_EnsignUniformArmor03 as Form) || (akBaseObject == CF05_Clothes_ScienceLabTec as Form)
    Actor PlayerRef = Game.GetPlayer()
    If !PlayerRef.WornHasKeyword(CF05_EnsignArmorKeyword_Disguise)
      PlayerRef.RemoveFromFaction(LC043SYFaction)
      PlayerRef.RemoveFromFaction(LC043SY01Faction)
      PlayerRef.RemoveFromFaction(LC043SY02Faction)
      PlayerRef.RemoveFromFaction(LC043SY03Faction)
    EndIf
  EndIf
EndEvent
