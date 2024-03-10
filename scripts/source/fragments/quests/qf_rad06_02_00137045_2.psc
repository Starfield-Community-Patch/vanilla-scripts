ScriptName Fragments:Quests:QF_RAD06_02_00137045_2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
Book Property RAD06_Trident_Dataslate Auto Const mandatory
ReferenceAlias Property Alias_ContractSlate Auto Const mandatory
MiscObject Property InorgExoticPlutonium Auto Const mandatory
GlobalVariable Property RAD06_KA_Job Auto Const mandatory
GlobalVariable Property RAD06_CurrentReward Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  rad06script kmyQuest = __temp as rad06script
  kmyQuest.InitResource()
EndFunction

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(100)
    Self.SetObjectiveDisplayed(50, True, False)
  EndIf
  If RAD06_KA_Job.GetValue() == 0.0
    RAD06_KA_Job.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rad06script kmyQuest = __temp as rad06script
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Actor pPlayer = Game.GetPlayer()
  ObjectReference oItem = pPlayer.PlaceAtMe(RAD06_Trident_Dataslate as Form, 1, False, False, True, None, None, True)
  Alias_ContractSlate.ForceRefTo(oItem)
  pPlayer.AddItem(oItem as Form, 1, False)
  RAD06_KA_Job.SetValue(2.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor pPlayer = Game.GetPlayer()
  pPlayer.RemoveItem(RAD06_Trident_Dataslate as Form, 1, True, None)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_8800_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
