ScriptName FFClinicR02_PlayerScript Extends ReferenceAlias conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group StagesAndIndices
  Int Property ResourceSearchStage = 10 Auto Const
  { Once this stage is set, start tracking the player's collection of the Resource }
  Int Property ResourceObjIndex = 10 Auto Const
  { Objective index we need to update each time the player collects the Resource }
EndGroup

Group Globals
  GlobalVariable Property FFClinicR02ItemCount Auto Const mandatory
  { Global var used to track how many Resources the player has collected }
  GlobalVariable Property FFClinicR02ItemTotal Auto Const mandatory
  { Global var used to know how many of the Resource we want the player to collect }
  GlobalVariable Property FFClinicR02ResourceNumber Auto Const mandatory
  { Global var used to know how which Resource we want the player to collect }
EndGroup

Group Objects
  resource Property ResOrgCommonToxin Auto Const mandatory
  { Toxin Resource object }
  resource Property ResOrgCommonSealant Auto Const mandatory
  { Sealant Resource object }
  resource Property ResOrgUncommonMembrane Auto Const mandatory
  { Membrane Resource object }
  resource Property ResOrgUncommonAntibiotic Auto Const mandatory
  { Antibiotic Resource object }
  resource Property ResOrgRareAnalgesic Auto Const mandatory
  { Analgesic Resource object }
  resource Property ResOrgRareSedative Auto Const mandatory
  { Sedative Resource object }
  resource Property ResOrgExoticNarcotic Auto Const mandatory
  { Narcotic Resource object }
  resource Property ResOrgExoticBiosuppressant Auto Const mandatory
  { Biosuppressant Resource object }
  Form Property ResourceItemFilter Auto
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == ResourceSearchStage
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    Self.RegisterPlayerForResourcePickup()
  EndIf
EndEvent

Function RegisterPlayerForResourcePickup()
  If FFClinicR02ResourceNumber.GetValueInt() == 1
    ResourceItemFilter = ResOrgCommonToxin as Form
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 2
    ResourceItemFilter = ResOrgCommonSealant as Form
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 3
    ResourceItemFilter = ResOrgUncommonMembrane as Form
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 4
    ResourceItemFilter = ResOrgUncommonAntibiotic as Form
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 5
    ResourceItemFilter = ResOrgRareAnalgesic as Form
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 6
    ResourceItemFilter = ResOrgRareSedative as Form
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 7
    ResourceItemFilter = ResOrgExoticNarcotic as Form
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 8
    ResourceItemFilter = ResOrgExoticBiosuppressant as Form
  EndIf
  Self.AddInventoryEventFilter(ResourceItemFilter)
  Utility.wait(3.0)
  Quest myQuest = Self.GetOwningQuest()
  myQuest.ModObjectiveGlobal(Game.GetPlayer().GetItemCount(ResourceItemFilter) as Float, FFClinicR02ItemCount, ResourceObjIndex, -1.0, True, True, True, False)
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest myQuest = Self.GetOwningQuest()
  myQuest.ModObjectiveGlobal(aiItemCount as Float, FFClinicR02ItemCount, ResourceObjIndex, -1.0, True, True, True, False)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  FFClinicR02ItemCount.SetValueInt(Game.GetPlayer().GetItemCount(ResourceItemFilter))
  Quest myQuest = Self.GetOwningQuest()
  myQuest.ModObjectiveGlobal(0.0, FFClinicR02ItemCount, ResourceObjIndex, -1.0, True, True, True, False)
EndEvent
