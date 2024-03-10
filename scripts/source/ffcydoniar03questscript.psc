ScriptName FFCydoniaR03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property BookAlias Auto
ReferenceAlias Property BookMarker Auto Const mandatory
ReferenceAlias Property Vendor Auto Const mandatory
GlobalVariable Property FFCydoniaR03_BookNumber Auto Const mandatory
FormList Property FFCydoniaR03_BookList Auto Const mandatory

;-- Functions ---------------------------------------

Function RemoveBook()
  ObjectReference myBook = BookAlias.GetRef()
  Actor myPlayer = Game.GetPlayer()
  If myPlayer.GetItemCount(myBook as Form) >= 1
    myPlayer.RemoveItem(myBook as Form, 1, False, None)
  EndIf
EndFunction

Function BookReward()
  Game.GetPlayer().AddItem(FFCydoniaR03_BookList.GetAt(FFCydoniaR03_BookNumber.GetValue() as Int - 1), 1, False)
EndFunction

Event OnQuestInit()
  Int iBookNumberValue = FFCydoniaR03_BookNumber.GetValue() as Int
  Form myBook = FFCydoniaR03_BookList.GetAt(iBookNumberValue - 1)
  ObjectReference myBookRef = BookMarker.GetRef().PlaceAtMe(myBook, 1, False, False, True, None, BookAlias as Alias, True)
  Vendor.GetRef().AddItem(myBookRef as Form, 1, False)
EndEvent
