ScriptName Fragments:Quests:QF_FFNeonZ11_002E8298 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeon Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
ReferenceAlias Property Alias_Lendel Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Quest Property CREW_EliteCrew_Vasco Auto Const mandatory
Perk Property CREW_Ship_AneutronicFusion Auto Const mandatory
Perk Property CREW_Ship_Shields Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Lendel.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Vasco.GetRef().MoveTo(Alias_Lendel.GetRef(), 0.0, 0.0, 0.0, True, False)
  CREW_EliteCrew_Vasco.SetStage(1)
  CREW_EliteCrew_Vasco.SetStage(50)
  Actor VascoRef = Alias_Vasco.GetActorRef()
  (VascoRef as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  VascoRef.EvaluatePackage(False)
  VascoRef.AddPerk(CREW_Ship_AneutronicFusion, False)
  VascoRef.AddPerk(CREW_Ship_Shields, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueFCNeon.SetStage(486)
  Self.Stop()
EndFunction
