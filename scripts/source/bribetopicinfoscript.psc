ScriptName BribeTopicInfoScript Extends TopicInfo Const
{ for bribe infos - remove credits }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CreditsToRemoveGlobal Auto Const mandatory
{ global used for credits to remove for this bribe }
conditionform Property Perk_CND_NegotiationRank4Check Auto Const mandatory
Message Property NegotiationRank4Message Auto Const mandatory
{ message for if you get a free bribe }
GlobalVariable Property NegotiationRank4Chance Auto Const mandatory
{ percentage chance to get a free bribe if you have Bribery rank 4 }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Self.RemoveItem(akSpeakerRef)
EndEvent

Function RemoveItem(ObjectReference akSpeakerRef)
  Bool freeBribe = False
  If Perk_CND_NegotiationRank4Check.IsTrue(None, None)
    Int freeBribeRoll = Utility.RandomInt(0, 100)
    Int freeBribeChance = NegotiationRank4Chance.GetValueInt()
    freeBribe = freeBribeRoll <= freeBribeChance
    If freeBribe
      NegotiationRank4Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
  If freeBribe == False
    Int countToRemove = CreditsToRemoveGlobal.GetValueInt()
    Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, countToRemove, False, akSpeakerRef)
  EndIf
EndFunction
