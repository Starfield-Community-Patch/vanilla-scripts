ScriptName Fragments:Quests:QF_LC125_0026607F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BossAlias Auto Const mandatory
Scene Property LC125SpawnBossScene Auto Const
ReferenceAlias Property Alias_BossEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_BossSupport01 Auto Const mandatory
ReferenceAlias Property Alias_BossSupport02 Auto Const mandatory
Scene Property LC125SpawnSopport01Scene Auto Const
Scene Property LC125SpawnSopport02Scene Auto Const
wwiseevent Property WWiseEvent_QST_LC125_BipedA_SkinC_SizeL Auto Const
ReferenceAlias Property Alias_BossRoarAudio Auto Const mandatory
RefCollectionAlias Property Alias_AllCreatures Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_BossEnableMarker.getref().enable(False)
  WWiseEvent_QST_LC125_BipedA_SkinC_SizeL.Play(Alias_BossRoarAudio.getref(), None, None)
  Utility.wait(0.5)
  Alias_BossAlias.getactorref().EvaluatePackage(False)
  Alias_BossSupport02.getactorref().EvaluatePackage(False)
  LC125SpawnBossScene.start()
  LC125SpawnSopport02Scene.start()
  Alias_BossAlias.getactorref().EvaluatePackage(False)
  Alias_BossSupport02.getactorref().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_BossAlias.getactorref().EvaluatePackage(False)
  Alias_BossAlias.getactorref().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Alias_BossSupport02.getactorref().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_AllCreatures.DisableAll(False)
EndFunction
