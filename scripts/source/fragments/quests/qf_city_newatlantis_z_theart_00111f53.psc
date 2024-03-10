ScriptName Fragments:Quests:QF_City_NewAtlantis_z_TheArt_00111F53 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Solomon Auto Const
ReferenceAlias Property Zoe Auto Const
ReferenceAlias Property Credits Auto Const
ReferenceAlias Property Art Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Zoe.GetActorRef().RemoveItem(Art.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Art.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Art.GetRef() as Form, 1, False, None)
  Solomon.GetActorRef().AddItem(Art.GetRef() as Form, 1, False)
  Utility.Wait(3.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
