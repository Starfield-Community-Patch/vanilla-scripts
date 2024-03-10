ScriptName Fragments:Quests:QF_FFConstantZ06_002117CA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_LetterParadiso Auto Const mandatory
ReferenceAlias Property Alias_LetterConstant Auto Const mandatory
Quest Property FFConstantZ04 Auto Const mandatory
Quest Property FFConstantZ05 Auto Const mandatory
ReferenceAlias Property Alias_Janet Auto Const mandatory
ReferenceAlias Property Alias_JanetMarker Auto Const mandatory
Topic Property FFConstantZ06_Janet_CallToPlayer Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFConstantZ06_Credits Auto Const mandatory
Scene Property FFConstantZ06_0050_Janet_Approach Auto Const mandatory
Outfit Property Outfit_Clothes_NewAtlantis_BusinessSuit_Female Auto Const mandatory
ActorValue Property FFConstantZ06_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference myJanet = Alias_Janet.GetRef()
  myJanet.MoveTo(Alias_JanetMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  myJanet.Enable(False)
  Alias_Janet.GetActorRef().SetOutfit(Outfit_Clothes_NewAtlantis_BusinessSuit_Female, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_Janet.GetActorRef().SetOutfit(Outfit_Clothes_NewAtlantis_BusinessSuit_Female, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Janet.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Janet.GetRef().Say(FFConstantZ06_Janet_CallToPlayer, None, False, None)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
  Alias_Janet.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor myPlayer = Game.GetPlayer()
  If FFConstantZ04.IsCompleted()
    myPlayer.AddItem(Alias_LetterParadiso.GetRef() as Form, 1, False)
  EndIf
  If FFConstantZ05.IsCompleted()
    myPlayer.AddItem(Alias_LetterConstant.GetRef() as Form, 1, False)
  EndIf
  myPlayer.SetValue(FFConstantZ06_ForeknowledgeAV, 1.0)
  Self.SetObjectivecompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_Janet.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor myPlayer = Game.GetPlayer()
  ObjectReference myLetterParadiso = Alias_LetterParadiso.GetRef()
  ObjectReference myLetterConstant = Alias_LetterConstant.GetRef()
  If myPlayer.GetItemCount(myLetterParadiso as Form)
    myPlayer.RemoveItem(myLetterParadiso as Form, 1, False, None)
  EndIf
  If myPlayer.GetItemCount(myLetterConstant as Form)
    myPlayer.RemoveItem(myLetterConstant as Form, 1, False, None)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
