ScriptName ApplyUnityActivatorScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SourceActor Auto Const
ReferenceAlias Property ReceivingActor Auto Const
ActorValue Property Health Auto Const mandatory
ActorValue Property Oxygen Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function ApplyUnityCharacter(Actor akSourceActor)
  Actor ReceivingActorREF = ReceivingActor.GetActorRef()
  Int myHealth = akSourceActor.GetValue(Health) as Int
  Int myOxygen = akSourceActor.GetValue(Oxygen) as Int
  Int myLevel = akSourceActor.GetLevel()
  ReceivingActorREF.SetValue(Health, myHealth as Float)
  ReceivingActorREF.SetValue(Oxygen, myOxygen as Float)
  Int myCredits = akSourceActor.GetItemCount(Credits as Form)
  ReceivingActorREF.AddItem(Credits as Form, myCredits, False)
  akSourceActor.RemoveAllItems(ReceivingActorREF as ObjectReference, False, False)
EndFunction

Event OnActivate(ObjectReference akActionRef)
  Self.ApplyUnityCharacter(SourceActor.GetActorRef())
EndEvent
