ScriptName DefaultShowMessageOnActivateAlias Extends ReferenceAlias Const default
{ Show the selected message when this ALIAS is activate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  Message Property MessageToShow Auto Const mandatory
  { The message to show when I'm activated. }
EndGroup

Group Optional_Properties
  Int Property Button0StageToSet = -1 Auto Const
  { Stage you want to set when Button 0 is clicked. }
  Int Property Button1StageToSet = -1 Auto Const
  { Stage you want to set when Button 1 is clicked. }
  Int Property Button2StageToSet = -1 Auto Const
  { Stage you want to set when Button 2 is clicked. }
  Int Property Button3StageToSet = -1 Auto Const
  { Stage you want to set when Button 3 is clicked. }
  Int Property MessageStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute (ie show MessageBox) }
  Bool Property ShowIfStageIsSet = False Auto Const
  { (Default: false) If true, will show message if stage is set. If false will show message until stage is set. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int iButton = 0
  If MessageToShow
    If MessageStage >= 0
      If Self.GetOwningQuest().GetStageDone(MessageStage) && ShowIfStageIsSet
        iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf !Self.GetOwningQuest().GetStageDone(MessageStage) && !ShowIfStageIsSet
        iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf Self.GetOwningQuest().GetStageDone(MessageStage) && !ShowIfStageIsSet
        
      ElseIf !Self.GetOwningQuest().GetStageDone(MessageStage) && ShowIfStageIsSet
        
      EndIf
    Else
      iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
  If iButton == 0
    If Button0StageToSet > -1
      Self.GetOwningQuest().SetStage(Button0StageToSet)
    EndIf
  ElseIf iButton == 1
    If Button1StageToSet > -1
      Self.GetOwningQuest().SetStage(Button1StageToSet)
    EndIf
  ElseIf iButton == 2
    If Button2StageToSet > -1
      Self.GetOwningQuest().SetStage(Button2StageToSet)
    EndIf
  ElseIf iButton == 3
    If Button3StageToSet > -1
      Self.GetOwningQuest().SetStage(Button3StageToSet)
    EndIf
  EndIf
EndEvent
