ScriptName Fragments:Scenes:SF_MQ302_225_ElevatorScene02_0013419A Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(False)
EndFunction

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(True)
EndFunction

Function Fragment_Phase_01_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  Actor allyRef = kmyQuest.Ally.GetActorRef()
  If allyRef != None
    allyRef.MoveToPackageLocation()
  EndIf
  Actor companionRef = kmyQuest.Companion.GetActorRef()
  If companionRef != None
    companionRef.MoveToPackageLocation()
  EndIf
EndFunction

Function Fragment_Phase_03_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.PlayElevator02NoWait()
  kmyQuest.SetStage(992)
EndFunction
