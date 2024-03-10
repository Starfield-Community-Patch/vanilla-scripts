ScriptName Fragments:Quests:QF_MQMisc02_001560EE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQMisc02MSG Auto Const mandatory
ReferenceAlias Property Alias_CompanionWhoDies Auto Const mandatory
ReferenceAlias Property Alias_Container Auto Const mandatory
Quest Property MQ206B Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef()
  ObjectReference ContainerREF = Alias_Container.GetRef()
  ContainerREF.Enable(False)
  DeadCompanionREF.RemoveAllItems(ContainerREF, False, False)
  MQMisc02MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  If MQ206B.IsRunning()
    MQ206B.SetActive(True)
  EndIf
  Self.Stop()
EndFunction
