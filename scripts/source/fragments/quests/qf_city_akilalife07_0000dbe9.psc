ScriptName Fragments:Quests:QF_City_AkilaLife07_0000DBE9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property AkilaLife06_DocPending Auto Const mandatory
ReferenceAlias Property Alias_Book01 Auto Const mandatory
ReferenceAlias Property Alias_Book02 Auto Const mandatory
ReferenceAlias Property Alias_Book03 Auto Const mandatory
ReferenceAlias Property Alias_Book04 Auto Const mandatory
ReferenceAlias Property Alias_Book05 Auto Const mandatory
ReferenceAlias Property Alias_Book06 Auto Const mandatory
Book Property Book01 Auto Const
Book Property Book02 Auto Const
Book Property Book03 Auto Const
Book Property Book04 Auto Const
Book Property Book05 Auto Const
Book Property Book06 Auto Const
Scene Property City_AkilaLife07_500_RhysBark Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook01 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook02 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook03 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook04 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook05 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script
  If Game.GetPlayer().GetItemCount(Book01 as Form) > 0
    kmyQuest.GotObject(200)
  EndIf
  If Game.GetPlayer().GetItemCount(Book02 as Form) > 0
    kmyQuest.GotObject(300)
  EndIf
  If Game.GetPlayer().GetItemCount(Book03 as Form) > 0
    kmyQuest.GotObject(400)
  EndIf
  If Game.GetPlayer().GetItemCount(Book04 as Form) > 0
    kmyQuest.GotObject(500)
  EndIf
  If Game.GetPlayer().GetItemCount(Book05 as Form) > 0
    kmyQuest.GotObject(600)
  EndIf
  If Game.GetPlayer().GetItemCount(Book06 as Form) > 0
    kmyQuest.GotObject(700)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(200)
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
  If Self.GetStageDone(300)
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
  If Self.GetStageDone(400)
    Self.SetObjectiveDisplayed(400, True, False)
  EndIf
  If Self.GetStageDone(500)
    Self.SetObjectiveDisplayed(500, True, False)
  EndIf
  If Self.GetStageDone(600)
    Self.SetObjectiveDisplayed(600, True, False)
  EndIf
  If Self.GetStageDone(700)
    Self.SetObjectiveDisplayed(700, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script
  kmyQuest.GotObject(200)
  Book bBook = Book01
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference
  oPlayer.RemoveItem(bBook as Form, 1, True, None)
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book01 as Alias, 1, True)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Game.GetPlayer().RemoveItem(Book01 as Form, 1, False, None)
  Self.SetStage(150)
  Alias_PlacedBook01.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script
  kmyQuest.GotObject(300)
  Book bBook = Book02
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference
  oPlayer.RemoveItem(bBook as Form, 1, True, None)
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book02 as Alias, 1, True)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Game.GetPlayer().RemoveItem(Book02 as Form, 1, False, None)
  Self.SetStage(150)
  Alias_PlacedBook02.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script
  kmyQuest.GotObject(400)
  Book bBook = Book03
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference
  oPlayer.RemoveItem(bBook as Form, 1, True, None)
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book03 as Alias, 1, True)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Game.GetPlayer().RemoveItem(Book03 as Form, 1, False, None)
  Self.SetStage(150)
  Alias_PlacedBook03.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script
  kmyQuest.GotObject(500)
  Book bBook = Book04
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference
  oPlayer.RemoveItem(bBook as Form, 1, True, None)
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book04 as Alias, 1, True)
  City_AkilaLife07_500_RhysBark.Start()
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Game.GetPlayer().RemoveItem(Book04 as Form, 1, False, None)
  Self.SetStage(150)
  Alias_PlacedBook04.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script
  kmyQuest.GotObject(600)
  Book bBook = Book05
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference
  oPlayer.RemoveItem(bBook as Form, 1, True, None)
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book05 as Alias, 1, True)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Game.GetPlayer().RemoveItem(Book05 as Form, 1, False, None)
  Self.SetStage(150)
  Alias_PlacedBook05.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script
  kmyQuest.GotObject(700)
  Book bBook = Book06
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference
  oPlayer.RemoveItem(bBook as Form, 1, True, None)
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book06 as Alias, 1, True)
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Game.GetPlayer().RemoveItem(Book06 as Form, 1, False, None)
  Self.SetStage(150)
  Alias_PlacedBook06.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
