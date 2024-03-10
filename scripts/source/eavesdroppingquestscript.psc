ScriptName EavesdroppingQuestScript Extends Quest
{ Quest script for eavesdropping quests based on EavesdroppingTemplate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestProperties
  Scene Property EavesdroppingScene Auto Const mandatory
  { The Eavesdropping Scene. }
  ReferenceAlias[] Property SceneAliases Auto Const mandatory
  { Array of actor aliases involved in the Eavesdropping Scene. }
EndGroup

Group AutofillProperties collapsedonbase
  ActorValue Property DMP_EavesdroppingSceneComplete Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Bool anySceneAliasDead = False
  Int I = 0
  While !anySceneAliasDead && I < SceneAliases.Length
    anySceneAliasDead = SceneAliases[I].GetRef() == None
    I += 1
  EndWhile
  If anySceneAliasDead
    Self.ShutdownQuest()
  Else
    Self.RegisterForRemoteEvent(EavesdroppingScene as ScriptObject, "OnEnd")
    EavesdroppingScene.Start()
  EndIf
EndEvent

Event Scene.OnEnd(Scene akSource)
  Self.ShutdownQuest()
EndEvent

Function ShutdownQuest()
  Int I = 0
  While I < SceneAliases.Length
    SceneAliases[I].TryToSetValue(DMP_EavesdroppingSceneComplete, 1.0)
    I += 1
  EndWhile
  Self.Stop()
EndFunction
