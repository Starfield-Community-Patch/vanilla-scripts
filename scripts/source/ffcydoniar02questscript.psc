ScriptName FFCydoniaR02QuestScript Extends Quest

;-- Variables ---------------------------------------
Form myItem

;-- Properties --------------------------------------
FormList Property FFCydoniaR02_CrimsonFleetItemList Auto Const mandatory
FormList Property FFCydoniaR02_EclipticItemList Auto Const mandatory
FormList Property FFCydoniaR02_HouseVaruunItemList Auto Const mandatory
FormList Property FFCydoniaR02_SpacersItemList Auto Const mandatory
FormList Property FFCydoniaR02_SyndicateItemList Auto Const mandatory
GlobalVariable Property FFCydoniaR02_EquipmentNeededCount Auto Const mandatory
GlobalVariable Property FFCydoniaR02_ItemsAcquired Auto Const mandatory
Keyword Property LocEncCrimsonFleet Auto Const mandatory
Keyword Property LocEncEcliptic Auto Const mandatory
Keyword Property LocEncHouseVaruun Auto Const mandatory
Keyword Property LocEncSpacers Auto Const mandatory
Keyword Property LocEncSyndicate Auto Const mandatory
LocationAlias Property Base Auto Const mandatory
ReferenceAlias Property BossContainer Auto Const mandatory
ReferenceAlias Property Denis Auto Const mandatory
ReferenceAlias Property Item Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckItems()
  If myItem != None
    Actor myPlayer = Game.GetPlayer()
    Int iCount = FFCydoniaR02_EquipmentNeededCount.GetValue() as Int
    If myPlayer.GetItemCount(myItem) >= iCount
      FFCydoniaR02_ItemsAcquired.SetValue(1.0)
      myPlayer.RemoveItem(myItem, iCount, False, Denis.GetRef())
    EndIf
  EndIf
EndFunction

Event OnQuestInit()
  Location myLoc = Base.GetLocation()
  FFCydoniaR02_ItemsAcquired.SetValue(0.0)
  Int iItemsNeeded = FFCydoniaR02_EquipmentNeededCount.GetValue() as Int
  Int I = 0
  If myLoc != None
    If myLoc.HasKeyword(LocEncCrimsonFleet)
      I = Utility.RandomInt(0, FFCydoniaR02_CrimsonFleetItemList.GetSize() - 1)
      myItem = FFCydoniaR02_CrimsonFleetItemList.GetAt(I)
    ElseIf myLoc.HasKeyword(LocEncEcliptic)
      I = Utility.RandomInt(0, FFCydoniaR02_EclipticItemList.GetSize() - 1)
      myItem = FFCydoniaR02_EclipticItemList.GetAt(I)
    ElseIf myLoc.HasKeyword(LocEncHouseVaruun)
      I = Utility.RandomInt(0, FFCydoniaR02_HouseVaruunItemList.GetSize() - 1)
      myItem = FFCydoniaR02_HouseVaruunItemList.GetAt(I)
    ElseIf myLoc.HasKeyword(LocEncSyndicate)
      I = Utility.RandomInt(0, FFCydoniaR02_SyndicateItemList.GetSize() - 1)
      myItem = FFCydoniaR02_SyndicateItemList.GetAt(I)
    ElseIf myLoc.HasKeyword(LocEncSpacers)
      I = Utility.RandomInt(0, FFCydoniaR02_SpacersItemList.GetSize() - 1)
      myItem = FFCydoniaR02_SpacersItemList.GetAt(I)
    EndIf
    If myItem != None
      ObjectReference myBossContainer = BossContainer.GetRef()
      myBossContainer.AddItem(myItem, iItemsNeeded - 1, False)
      myBossContainer.AddAliasedItem(myItem, Item as Alias, 1, True)
    EndIf
  EndIf
EndEvent
