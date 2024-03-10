ScriptName RQ_DeliverScript Extends RQScript

;-- Variables ---------------------------------------
Bool Created

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard modifyItemGuard

;-- Properties --------------------------------------
Group Scan_Deliver
  ReferenceAlias Property ItemSpawnAt Auto Const mandatory
  { the alias that will the item will be spawned at/in }
  Bool Property SpawnIn = True Auto Const
  { if true (Default) ItemToCreate will be spawned IN the inventory of ItemSpawnAt. If false, will be spawned AT it. }
  ReferenceAlias Property Item Auto Const mandatory
  { the alias that will hold the item to deliver (Reference of ItemToCreate will be forced into this.) It will be initially disabled }
  Form Property ItemToCreate Auto Const mandatory
  { the item to deliver, will be created at StageToCreateItem }
  Int Property EnableItemStage = -1 Auto Const
  { When this stage is set, the item will be enabled }
  Int Property SpawnStage = 10 Auto Const
  { stage to set to trigger spawning - use a stage so we have a chance to register for spawn event }
  Int Property TurnOffQuestStage = -1 Auto Const
  { stage to set TurnOffQuestGlobal }
  GlobalVariable Property TurnOffQuestGlobal Auto Const
  { OPTIONAL - if included, this will be set to 1 when the player picks up the item (so it can be used as a condition to not run the quest again) }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript
  Self.RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns as ScriptObject, "defaultgroupspawnquestscript_SpawnGroupDoneEvent")
  Self.SetStage(SpawnStage)
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == EnableItemStage
    Self.EnableItemIfAppropriate()
  ElseIf auiStageID == TurnOffQuestStage
    If TurnOffQuestGlobal
      TurnOffQuestGlobal.SetValueInt(1)
    EndIf
  EndIf
EndEvent

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(defaultgroupspawnquestscript akSender, Var[] akArgs)
  Self.CreateItem()
EndEvent

Function CreateItem()
  Guard modifyItemGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference spawnAtRef = ItemSpawnAt.GetReference()
    If Created == False && spawnAtRef as Bool
      Self.UnregisterForRemoteEvent(ItemSpawnAt as ScriptObject, "OnAliasChanged")
      Created = True
      ObjectReference itemRef = ItemSpawnAt.GetReference().PlaceAtMe(ItemToCreate, 1, False, True, True, None, Item as Alias, True)
      If SpawnIn
        spawnAtRef.AddItem(itemRef as Form, 1, False)
      Else
        Self.EnableItemIfAppropriate()
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function EnableItemIfAppropriate()
  If SpawnIn == False && (EnableItemStage == -1 || Self.GetStageDone(EnableItemStage))
    Item.TryToEnable()
  EndIf
EndFunction

Function CleanUpItem()
  Guard modifyItemGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If Created
      If SpawnIn
        ObjectReference spawnAtRef = ItemSpawnAt.GetReference()
        spawnAtRef.RemoveItem(ItemToCreate, 1, False, None)
      Else
        Item.TryToDisable()
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
