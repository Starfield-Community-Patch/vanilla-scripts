ScriptName MS06_QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct ResourceData
  resource ResourceType
  { The type of Reource we're looking for }
  GlobalVariable ResourceCount
  { The amount of the resource we have }
  GlobalVariable ResourceTotal
  { The amount of the resource we need }
  Int ResourceObjective
  { The objective associated with the Resource Type }
  Bool ResourceFulfilled
  { Does the player have the required amount? }
EndStruct


;-- Variables ---------------------------------------
Int ExplodeTimerID = 1

;-- Properties --------------------------------------
ActorValue Property DockingPermission Auto Const mandatory
conditionform Property MS06_ResourceConditionForm Auto Const mandatory
GlobalVariable Property MS06ChoiceValue Auto Const mandatory
GlobalVariable Property MS06_GravDriveCreditsAmount Auto Const mandatory
GlobalVariable Property MS06_GravDriveCreditsAmountLess Auto Const mandatory
GlobalVariable Property MS06Resource01Count Auto Const mandatory
GlobalVariable Property MS06Resource01Total Auto Const mandatory
GlobalVariable Property MS06Resource01ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Resource02Count Auto Const mandatory
GlobalVariable Property MS06Resource02Total Auto Const mandatory
GlobalVariable Property MS06Resource02ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Resource03Count Auto Const mandatory
GlobalVariable Property MS06Resource03Total Auto Const mandatory
GlobalVariable Property MS06Resource03ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Resource04Count Auto Const mandatory
GlobalVariable Property MS06Resource04Total Auto Const mandatory
GlobalVariable Property MS06Resource04ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Retrofit01Status Auto Const mandatory
GlobalVariable Property MS06Retrofit02Status Auto Const mandatory
GlobalVariable Property MS06Retrofit03Status Auto Const mandatory
Int Property GatherResourcesStage = 1000 Auto Const
Int Property ResourcesCompletedStage = 1500 Auto Const
Int Property CompletedRetrofitStage = 2400 Auto Const
Int Property EscapeStage = 3200 Auto Const
MiscObject Property Credits Auto Const mandatory
MiscObject Property OrgCommonFiber Auto Const mandatory
MiscObject Property OrgUncommonSealant Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
MiscObject Property InorgRareLithium Auto Const mandatory
ReferenceAlias Property KlaxonSoundMarker Auto Const mandatory
ReferenceAlias Property Player Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property ECSConstantShip Auto Const mandatory
RefCollectionAlias Property Klaxons Auto Const mandatory
RefCollectionAlias Property LightsOff Auto Const mandatory
resource Property ResOrgCommonFiber Auto Const mandatory
resource Property ResOrgCommonSealant Auto Const mandatory
resource Property ResInorgCommonIron Auto Const mandatory
resource Property ResInorgRareLithium Auto Const mandatory
LeveledItem Property MS06_LL_ConstantGoods Auto Const mandatory
Float Property ExplodeTimerLength = 10.0 Auto Const
ms06_questscript:resourcedata[] Property ResourceDatum Auto

;-- Functions ---------------------------------------

Function SetChoice(Int aiChoiceValue)
  MS06ChoiceValue.SetValue(aiChoiceValue as Float)
EndFunction

Function RegisterPlayerforInventoryFilter()
  ms06_playerscript myPlayerScript = Player as ms06_playerscript
  myPlayerScript.RegisterPlayerForResourceTracking()
EndFunction

Function ResourceCheck()
  Int I = 0
  Int iLength = ResourceDatum.Length
  While I < iLength
    GlobalVariable myResourceCount = ResourceDatum[I].ResourceCount
    Int MyPlayerComponentCount = Game.GetPlayer().GetComponentCount(ResourceDatum[I].ResourceType as Form)
    If myResourceCount.GetValue() != MyPlayerComponentCount as Float
      myResourceCount.SetValue(MyPlayerComponentCount as Float)
      Self.UpdateCurrentInstanceGlobal(ResourceDatum[I].ResourceCount)
      If ResourceDatum[I].ResourceCount.GetValue() >= ResourceDatum[I].ResourceTotal.GetValue()
        ResourceDatum[I].ResourceFulfilled = True
        Self.SetObjectiveDisplayed(ResourceDatum[I].ResourceObjective, False, False)
      Else
        ResourceDatum[I].ResourceFulfilled = False
        Self.SetObjectiveDisplayed(ResourceDatum[I].ResourceObjective, True, True)
      EndIf
    EndIf
    I += 1
  EndWhile
  Self.AllResourcesCheck()
EndFunction

Function AllResourcesCheck()
  Int I = 0
  Int iLength = ResourceDatum.Length
  Bool ResourcesFulfilled = False
  While I < iLength
    If ResourceDatum[I].ResourceFulfilled == True
      ResourcesFulfilled = True
    Else
      ResourcesFulfilled = False
      I = iLength
    EndIf
    I += 1
  EndWhile
  If ResourcesFulfilled == True
    If Self.GetStageDone(ResourcesCompletedStage)
      Self.SetObjectiveDisplayed(ResourcesCompletedStage, True, False)
    Else
      Self.SetStage(ResourcesCompletedStage)
    EndIf
  ElseIf Self.GetStageDone(ResourcesCompletedStage)
    Self.SetObjectiveDisplayed(ResourcesCompletedStage, False, False)
  EndIf
EndFunction

Function RemoveResources()
  If MS06_ResourceConditionForm.IsTrue(Game.GetPlayer() as ObjectReference, None)
    Game.GetPlayer().RemoveItemByComponent(ResOrgCommonFiber as Form, MS06Resource01Total.GetValue() as Int, False, None)
    Game.GetPlayer().RemoveItemByComponent(ResOrgCommonSealant as Form, MS06Resource02Total.GetValue() as Int, False, None)
    Game.GetPlayer().RemoveItemByComponent(ResInorgCommonIron as Form, MS06Resource03Total.GetValue() as Int, False, None)
    Game.GetPlayer().RemoveItemByComponent(ResInorgRareLithium as Form, MS06Resource04Total.GetValue() as Int, False, None)
  EndIf
EndFunction

Function RemoveCredits(Bool abSpeechChallengeSuccess)
  If abSpeechChallengeSuccess == False
    Game.GetPlayer().RemoveItem(Credits as Form, MS06_GravDriveCreditsAmount.GetValue() as Int, False, None)
  Else
    Game.GetPlayer().RemoveItem(Credits as Form, MS06_GravDriveCreditsAmountLess.GetValue() as Int, False, None)
  EndIf
EndFunction

Function CheckEngineeringTerminalSettings()
  If !Self.GetStageDone(CompletedRetrofitStage)
    If MS06Retrofit01Status.GetValue() == 1.0 && MS06Retrofit02Status.GetValue() == 1.0 && MS06Retrofit03Status.GetValue() == 1.0
      Self.SetStage(CompletedRetrofitStage)
    EndIf
  EndIf
EndFunction

Function ConstantGiveResources()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.AddItem(OrgCommonFiber as Form, MS06Resource01ConstantAmount.GetValue() as Int, False)
  myPlayer.AddItem(OrgUncommonSealant as Form, MS06Resource02ConstantAmount.GetValue() as Int, False)
  myPlayer.AddItem(InorgCommonIron as Form, MS06Resource03ConstantAmount.GetValue() as Int, False)
  myPlayer.AddItem(InorgRareLithium as Form, MS06Resource04ConstantAmount.GetValue() as Int, False)
EndFunction

Function ConstantGiveGoods()
  Game.GetPlayer().AddItem(MS06_LL_ConstantGoods as Form, 1, False)
EndFunction

Function DebugGiveResources()
  Game.GetPlayer().AddItem(OrgCommonFiber as Form, MS06Resource01Total.GetValue() as Int, False)
  Game.GetPlayer().AddItem(OrgUncommonSealant as Form, MS06Resource02Total.GetValue() as Int, False)
  Game.GetPlayer().AddItem(InorgCommonIron as Form, MS06Resource03Total.GetValue() as Int, False)
  Game.GetPlayer().AddItem(InorgRareLithium as Form, MS06Resource04Total.GetValue() as Int, False)
EndFunction

Function StartKlaxons()
  KlaxonSoundMarker.GetRef().Enable(False)
  Int I = 0
  Int iCount = Klaxons.GetCount()
  While I < iCount
    ObjectReference myKlaxon = Klaxons.GetAt(I)
    myKlaxon.PlayAnimation("TurnOnPulse")
    I += 1
  EndWhile
EndFunction

Function SetECSConstantSelfDestruct()
  LightsOff.DisableAll(False)
  Self.StartKlaxons()
EndFunction

Function ECSConstantExplode()
  ECSConstantShip.GetShipReference().SetValue(DockingPermission, 4.0)
  Self.StartTimer(ExplodeTimerLength, ExplodeTimerID)
EndFunction

Event OnTimer(Int aiTimerId)
  If aiTimerId == ExplodeTimerID
    KlaxonSoundMarker.GetRef().Disable(False)
    spaceshipreference myShip = ECSConstantShip.GetRef() as spaceshipreference
    myShip.SetValue(Game.GetInvulnerableAV(), 0.0)
    myShip.IgnoreFriendlyHits(False)
    myShip.KillEssential(None)
  EndIf
EndEvent
