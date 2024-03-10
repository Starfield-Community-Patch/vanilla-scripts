ScriptName Fragments:Quests:QF_BE_RI03_0024015E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI03 Auto Const mandatory
RefCollectionAlias Property Alias_GenericTurrets Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  RI03.SetStage(600)
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()
  myCell.SetPublic(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetCrewPlayerFriend(True, True)
EndFunction

Function Fragment_Stage_0150_Item_00()
  ObjectReference PilotSeatRef = Alias_PilotSeat.GetRef()
  Cell myCell = PilotSeatRef.GetParentCell()
  PilotSeatRef.BlockActivation(False, False)
  myCell.SetFactionOwner(None)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_GenericTurrets.SetUnconscious(False)
EndFunction
