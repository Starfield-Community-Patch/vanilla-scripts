ScriptName Fragments:Quests:QF_Patch_Hotfix_002058DE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ103 Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Quest Property FC03 Auto Const mandatory
Quest Property FC04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If MQ103.IsCompleted() && MQ104A.IsCompleted() && MQ104B.IsCompleted()
    If MQ105.IsCompleted() == False && MQ105.IsRunning() == False
      MQ105.SetStage(10)
    EndIf
  EndIf
  If FC03.IsCompleted() && FC04.IsRunning() == False
    FC04.SetStage(40)
  EndIf
EndFunction
