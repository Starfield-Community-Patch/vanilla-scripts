ScriptName Fragments:Quests:QF_FFCydoniaZ04_0023F810 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property StackOfDrawings Auto Const mandatory
Quest Property FFCydoniaZ04Misc Auto Const mandatory
RefCollectionAlias Property Alias_Walls Auto Const mandatory
Quest Property FFCydoniaZ04Posters Auto Const mandatory
Message Property FFCydoniaR04_SpaceFrogRecipe_MSG Auto Const mandatory
ActorValue Property FFCydoniaZ04_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If FFCydoniaZ04Misc.IsRunning()
    FFCydoniaZ04Misc.SetStage(1000)
  EndIf
  Alias_Walls.EnableAll(False)
  Self.SetObjectiveDisplayed(100, True, False)
  Game.GetPlayer().AddItem(StackOfDrawings.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(StackOfDrawings.GetRef() as Form, 1, False, None)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().SetValue(FFCydoniaZ04_ForeknowledgeAV, 1.0)
  FFCydoniaZ04Posters.Start()
  FFCydoniaR04_SpaceFrogRecipe_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.Stop()
EndFunction
