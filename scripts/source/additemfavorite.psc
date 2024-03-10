ScriptName AddItemFavorite Extends ObjectReference

;-- Variables ---------------------------------------
Form ItemToFavorite

;-- Properties --------------------------------------
Int Property FavoriteSlot = -1 Auto Const
GlobalVariable Property ItemHasFavorited Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  ItemToFavorite = Self.GetBaseObject()
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  If akNewContainer == Game.GetPlayer() as ObjectReference
    Game.GetPlayer().MarkItemAsFavorite(ItemToFavorite, FavoriteSlot)
  EndIf
EndEvent
