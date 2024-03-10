ScriptName Fragments:Quests:QF_CFKey_00297E3A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_CF02SecurityDoors Auto Const mandatory
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0005_Item_00()
  Int I = 0
  Int count = Alias_CF02SecurityDoors.GetCount()
  While I < count
    Alias_CF02SecurityDoors.GetAt(I).SetOpen(False)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int I = 0
  Int count = Alias_CF02SecurityDoors.GetCount()
  While I < count
    Alias_CF02SecurityDoors.GetAt(I).SetOpen(True)
    I += 1
  EndWhile
  Self.Stop()
EndFunction
