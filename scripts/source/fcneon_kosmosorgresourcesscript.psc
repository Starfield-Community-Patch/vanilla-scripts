ScriptName FCNeon_KosmosOrgResourcesScript Extends Quest

;-- Structs -----------------------------------------
Struct ResourceGlobalMap
  resource theResource
  { The resource. }
  GlobalVariable theResourceCountGlobal
  { The Global Variable that tracks the count of this resource. }
  Int maxToSell
  { The maximum number of this Resource to sell at any given time. }
  GlobalVariable resourceSellPriceGlobal
  { The Global Variable that stores the amount to sell this Resource for (per unit). }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group required
  fcneon_kosmosorgresourcesscript:resourceglobalmap[] Property ResourcesAndGlobals Auto Const mandatory
  { An array of Resources and their mapped Global Variables that track the count of each of the Resources that Kosmos will buy. }
  GlobalVariable Property FCNeon_Kosmos_NextTurnInGameTime Auto Const mandatory
  { A variable that tracks the next allowed turn-in time for this quest. }
  Float Property TurnInDuration = 0.699999988 Auto Const
  { The duration (in UT game days) between allowed turn-ins of this quest. }
EndGroup

Int Property RESOURCETYPE_BIOSUPPRESSANT = 0 AutoReadOnly
Int Property RESOURCETYPE_HYPERCATALYST = 1 AutoReadOnly
Int Property RESOURCETYPE_LUBRICANT = 2 AutoReadOnly
Int Property RESOURCETYPE_STIMULANT = 3 AutoReadOnly
Int Property RESOURCETYPE_POLYMER = 4 AutoReadOnly
Int Property RESOURCETYPE_SOLVENT = 5 AutoReadOnly
Int Property RESOURCETYPE_GASTRONOMIC = 6 AutoReadOnly

;-- Functions ---------------------------------------

Function UpdatePlayerResourceCounts()
  Actor playerRef = Game.GetPlayer()
  Int I = 0
  While I < ResourcesAndGlobals.Length
    fcneon_kosmosorgresourcesscript:resourceglobalmap rgMap = ResourcesAndGlobals[I]
    rgMap.theResourceCountGlobal.SetValueInt(playerRef.GetComponentCount(rgMap.theResource as Form))
    Self.UpdateCurrentInstanceGlobal(rgMap.theResourceCountGlobal)
    I += 1
  EndWhile
EndFunction

Function SellResource(Int aiResourceIndex)
  If aiResourceIndex < 0
    Return 
  EndIf
  Actor playerRef = Game.GetPlayer()
  fcneon_kosmosorgresourcesscript:resourceglobalmap rgMap = ResourcesAndGlobals[aiResourceIndex]
  Int resourceCount = playerRef.GetComponentCount(rgMap.theResource as Form)
  If resourceCount <= 0
    Return 
  EndIf
  Int countToSell = 0
  If resourceCount > rgMap.maxToSell
    countToSell = rgMap.maxToSell
  Else
    countToSell = resourceCount
  EndIf
  playerRef.RemoveItemByComponent(rgMap.theResource as Form, countToSell, False, None)
  playerRef.AddItem(Game.GetCredits() as Form, rgMap.resourceSellPriceGlobal.GetValueInt() * countToSell, False)
  FCNeon_Kosmos_NextTurnInGameTime.SetValue(Utility.GetCurrentGameTime() + TurnInDuration)
EndFunction
