ScriptName SQ_TreasureMap_CreateScript Extends ObjectReference
{ place this script on a container to create treasure map(s) in it on load
  NOTE: only 1 scripted container per location! }

;-- Variables ---------------------------------------
Quest[] myQuests

;-- Properties --------------------------------------
Keyword Property SQ_TreasureMap_CreateMapStoryEvent Auto Const mandatory
{ story event to send to try to place treasure maps for sale by vendor }
Int Property TreasureMapType = -1 Auto Const
{ specify which type of treasure map is allowed for this container:
    -1 = any
    0 = surface
    1 = resources
    2 = space }
Int Property TreasureMapProximityRestriction = -1 Auto Const
{ specify any "proximity" that isn't allowed for this vendor (sent with story event as Value2):
    -1 = no restriction
    0 = local area
    1 = same planet - if restricted, also prevent local area
    2 = same system
    3 = different system }
GlobalVariable Property SQ_TreasureMap_CreateAny Auto Const mandatory
{ holds value for story manager to create any type of treasure map (99) }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.CheckQuests() == False
    Int aiValue1 = TreasureMapType
    If aiValue1 < 0
      aiValue1 = SQ_TreasureMap_CreateAny.GetValueInt()
    EndIf
    Int aiValue2 = TreasureMapProximityRestriction
    If aiValue2 < 0
      aiValue2 = SQ_TreasureMap_CreateAny.GetValueInt()
    EndIf
    myQuests = SQ_TreasureMap_CreateMapStoryEvent.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, aiValue1, aiValue2)
  EndIf
EndEvent

Bool Function CheckQuests()
  Bool isQuestRunning = False
  Int I = myQuests.Length - 1
  While I >= 0
    Quest theQuest = myQuests[I]
    If theQuest.IsRunning()
      isQuestRunning = True
    Else
      myQuests.remove(I, 1)
    EndIf
    I -= 1
  EndWhile
  Return isQuestRunning
EndFunction
