ScriptName CustomItemQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct ItemDatum
  String ID
  { Indentifier - used to help identify items in array. Not otherwise used. }
  Int QuestStage
  { Spawn item at this quest stage }
  LeveledItem LeveledListToSpawnFrom
  { List to spawn from }
  FormList ModsFormlist
  { List of mods to install on item
****IMPORTANT NOTE***
THIS BYPASSES ALL NORMAL ITEM INSTANTIATION RULES }
  ObjectReference ReferenceToSpawnIn
  { Where to spawn item }
  ReferenceAlias AliasToSpawnIn
  { Where to spawn in, overrides ReferenceToSpawnIn }
  Bool PlaceAtMeInstead
  { Place AT instead of IN ReferenceToSpawnIn }
  ReferenceAlias AliasToForceItemInto
  { if set, item will be forced into this alias }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
customitemquestscript:itemdatum[] Property ItemData Auto Const

;-- Functions ---------------------------------------

Event OnStageSet(Int auiStageID, Int auiItemID)
  Int foundIndex = ItemData.findstruct("QuestStage", auiStageID, 0)
  customitemquestscript:itemdatum FoundDatum = None
  If foundIndex >= 0
    FoundDatum = ItemData[foundIndex]
  EndIf
  If FoundDatum as Bool && auiItemID == 0
    ObjectReference spawnInRef = None
    If FoundDatum.AliasToSpawnIn
      spawnInRef = FoundDatum.AliasToSpawnIn.GetReference()
    ElseIf FoundDatum.ReferenceToSpawnIn
      spawnInRef = FoundDatum.ReferenceToSpawnIn
    Else
      spawnInRef = Game.GetPlayer() as ObjectReference
    EndIf
    CustomItemQuestScript.SpawnCustomItem(FoundDatum.LeveledListToSpawnFrom, FoundDatum.ModsFormlist, spawnInRef, FoundDatum.PlaceAtMeInstead, FoundDatum.AliasToForceItemInto)
  EndIf
EndEvent

Form Function SpawnCustomItem(LeveledItem LeveledListToSpawnFrom, FormList ModsFormlist, ObjectReference ReferenceToSpawnIn, Bool PlaceAtMeInstead, ReferenceAlias AliasToForceItemInto) Global
  ObjectReference item = ReferenceToSpawnIn.PlaceAtMe(LeveledListToSpawnFrom as Form, 1, False, True, False, None, None, True)
  Int I = 0
  While I < ModsFormlist.GetSize()
    objectmod omod = ModsFormlist.GetAt(I) as objectmod
    Bool success = item.AttachMod(omod, 0)
    If success == False
      
    EndIf
    I += 1
  EndWhile
  item.enable(False)
  If AliasToForceItemInto
    AliasToForceItemInto.ForceRefTo(item)
  EndIf
  If PlaceAtMeInstead
    
  Else
    ReferenceToSpawnIn.additem(item as Form, 1, False)
  EndIf
  Return item as Form
EndFunction
