ScriptName SQ_TreasureMapScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryManagerEventKeyword Auto Const mandatory
ObjectReference Property SQ_TreasureMapHoldingCellMarker Auto Const mandatory
{ autofill }
Form Property Treasure Auto Const mandatory
{ treasure that will be created and placed in quest location }
objectmod Property TreasureMod Auto Const
{ OPTIONAL: mod to add to treasure when created - obviously can only be used for weapons or armor (and only if the Treasure is one or the other)
    TEMP: this will be removed once this task is done: GEN-424645 }
Int Property TreasureLocation = 0 Auto Const
{ sent with story event as Value1: 
  0 = surface
  1 = resources
  2 = space }
Int Property TreasureProximity = 2 Auto Const
{ sent with story event as Value2:
    0 = local area (find location in current block pattern)
    1 = same planet
    2 = same system
    3 = different system }
Int Property TreasureQuantityMin = 1 Auto Const
{ this is used for cases where more than 1 item of treasure is needed (usually for resource maps) }
Int Property TreasureQuantityMax = 1 Auto Const
Bool Property TreasureAllTheSameThing = True Auto Const
{ true = additional treasure will use base object of first treasure created for all additional items - so it will be a uniform stack
  false = additional treaure will use whatever settings on the Treasure leveled list - so it could be a range of items }
sq_treasuremapquestscript Property myQuest Auto hidden
{ filled when treasure quest is started }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  If myQuest == None
    If akNewContainer == Game.GetPlayer() as ObjectReference
      Self.StartTreasureQuest()
    EndIf
  EndIf
EndEvent

Function StartTreasureQuest()
  ObjectReference treasureRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(Treasure, 1, False, False, True, None, None, True)
  SQ_TreasureMapScript treasureMapRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(Self.GetBaseObject(), 1, False, False, True, None, None, True) as SQ_TreasureMapScript
  sq_treasuremapquestscript[] myQuests = StoryManagerEventKeyword.SendStoryEventAndWait(None, treasureRef, treasureMapRef as ObjectReference, TreasureLocation, TreasureProximity) as sq_treasuremapquestscript[]
  If myQuests.Length > 0
    myQuest = myQuests[0]
    Int failsafeCount = 0
    While myQuest.IsStarting() && failsafeCount < 100
      Utility.wait(0.100000001)
      failsafeCount += 1
    EndWhile
    ObjectReference player = Game.GetPlayer() as ObjectReference
    player.RemoveItem(Self as Form, 1, True, None)
    player.AddItem(myQuest.TreasureMap.GetRef() as Form, 1, True)
  EndIf
EndFunction
