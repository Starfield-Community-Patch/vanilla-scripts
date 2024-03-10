ScriptName Fragments:Quests:QF_TestKurtQuest_0000188F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
RefCollectionAlias Property Alias_CreatedItems Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Int I = Alias_CreatedItems.GetCount()
  ObjectReference theContainer = Game.GetPlayer() as ObjectReference
  While I >= 0
    ObjectReference theRef = Alias_CreatedItems.GetAt(I)
    theContainer.RemoveItem(theRef as Form, 1, False, None)
    I += -1
  EndWhile
EndFunction
