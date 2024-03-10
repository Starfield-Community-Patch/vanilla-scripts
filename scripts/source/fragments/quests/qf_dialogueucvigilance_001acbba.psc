ScriptName Fragments:Quests:QF_DialogueUCVigilance_001ACBBA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Archangel Auto Const mandatory
ReferenceAlias Property Alias_Jailor Auto Const mandatory
Scene Property DialogueUCVigilance_IntroBrigScene Auto Const mandatory
ReferenceAlias Property Alias_BrigGuard Auto Const mandatory
GlobalVariable Property DialogueUCVigilance_BrigGlobal Auto Const mandatory
Scene Property DialogueUCVigilance_Jivanta_SceneTurret Auto Const mandatory
ReferenceAlias Property Alias_Jivanta Auto Const mandatory
ReferenceAlias Property Alias_JivantaInspecting Auto Const mandatory
ReferenceAlias Property Alias_AudioLogKryx Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker01 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker02 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker03 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker04 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker05 Auto Const mandatory
RefCollectionAlias Property Alias_CF07_StageActors Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Officer_Male Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Recruit_Male Auto Const mandatory
ActorBase Property LvlMarine_SysDef Auto Const mandatory
Keyword Property LinkCustom06 Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Support Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Assault Auto Const mandatory
Keyword Property LinkCustom07 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker06 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker07 Auto Const mandatory
RefCollectionAlias Property VigilanceMainActors Auto Const mandatory
RefCollectionAlias Property Alias_OperationsActorsAll Auto Const mandatory
Faction Property CrimeFactionUCSysDef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_CF07_StagingMarker01.Clear()
  Alias_CF07_StagingMarker02.Clear()
  Alias_CF07_StagingMarker03.Clear()
  Alias_CF07_StagingMarker04.Clear()
  Alias_CF07_StagingMarker05.Clear()
  Int I = 0
  Actor[] SysDefCrew = Alias_OperationsActorsAll.GetActorArray()
  While I < SysDefCrew.Length
    SysDefCrew[I].SetCrimeFaction(CrimeFactionUCSysDef)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_CF07_StagingMarker01.GetRef().DisableNoWait(False)
  Alias_CF07_StagingMarker02.GetRef().DisableNoWait(False)
  Alias_CF07_StagingMarker03.GetRef().DisableNoWait(False)
  Alias_CF07_StagingMarker04.GetRef().DisableNoWait(False)
  ObjectReference[] CF07Actors = Alias_CF07_StageActors.GetArray()
  Int q = 0
  While q < CF07Actors.Length
    VigilanceMainActors.RemoveRef(CF07Actors[q])
    q += 1
  EndWhile
  Alias_CF07_StageActors.DisableAll(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_CF07_StagingMarker01.RefillAlias()
  Alias_CF07_StagingMarker02.RefillAlias()
  Alias_CF07_StagingMarker03.RefillAlias()
  Alias_CF07_StagingMarker04.RefillAlias()
  Alias_CF07_StagingMarker05.RefillAlias()
  ObjectReference Chair01Ref = Alias_CF07_StagingMarker01.GetRef()
  Chair01Ref.EnableNoWait(False)
  ObjectReference Marine01Ref = Chair01Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male as Form, 1, False, False, True, None, None, True)
  Marine01Ref.SetLinkedRef(Chair01Ref, LinkCustom06, True)
  Alias_CF07_StageActors.AddRef(Marine01Ref)
  ObjectReference Chair02Ref = Alias_CF07_StagingMarker02.GetRef()
  Chair02Ref.EnableNoWait(False)
  ObjectReference Marine02Ref = Chair02Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male as Form, 1, False, False, True, None, None, True)
  Marine02Ref.SetLinkedRef(Chair02Ref, LinkCustom06, True)
  Alias_CF07_StageActors.AddRef(Marine01Ref)
  ObjectReference Chair03Ref = Alias_CF07_StagingMarker03.GetRef()
  Chair03Ref.EnableNoWait(False)
  ObjectReference Marine03Ref = Chair03Ref.PlaceAtMe(LvlMarine_SysDef as Form, 1, False, False, True, None, None, True)
  Marine03Ref.SetLinkedRef(Chair03Ref, LinkCustom06, True)
  Alias_CF07_StageActors.AddRef(Marine03Ref)
  ObjectReference Chair04Ref = Alias_CF07_StagingMarker04.GetRef()
  Chair04Ref.EnableNoWait(False)
  ObjectReference Marine04Ref = Chair04Ref.PlaceAtMe(LvlMarine_SysDef_Support as Form, 1, False, False, True, None, None, True)
  Marine04Ref.SetLinkedRef(Chair04Ref, LinkCustom06, True)
  Alias_CF07_StageActors.AddRef(Marine04Ref)
  ObjectReference Chair05Ref = Alias_CF07_StagingMarker05.GetRef()
  ObjectReference Marine05Ref = Chair05Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male as Form, 1, False, False, True, None, None, True)
  Marine05Ref.SetLinkedRef(Chair05Ref, LinkCustom06, True)
  Alias_CF07_StageActors.AddRef(Marine05Ref)
  ObjectReference Chair06Ref = Alias_CF07_StagingMarker06.GetRef()
  ObjectReference Marine06Ref = Chair06Ref.PlaceAtMe(LvlMarine_SysDef_Assault as Form, 1, False, False, True, None, None, True)
  Marine06Ref.SetLinkedRef(Chair06Ref, LinkCustom07, True)
  Alias_CF07_StageActors.AddRef(Marine06Ref)
  ObjectReference Chair07Ref = Alias_CF07_StagingMarker07.GetRef()
  ObjectReference Marine07Ref = Chair07Ref.PlaceAtMe(LvlMarine_SysDef_Assault as Form, 1, False, False, True, None, None, True)
  Marine07Ref.SetLinkedRef(Chair07Ref, LinkCustom07, True)
  Alias_CF07_StageActors.AddRef(Marine07Ref)
  Actor[] CF07Actors = Alias_CF07_StageActors.GetActorArray()
  Int q = 0
  While q < CF07Actors.Length
    VigilanceMainActors.AddRef(CF07Actors[q] as ObjectReference)
    CF07Actors[q].SetCrimeFaction(CrimeFactionUCSysDef)
    q += 1
  EndWhile
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(85, True)
  If Self.GetStageDone(85)
    Self.SetObjectiveDisplayed(25, True, False)
  Else
    Alias_AudioLogKryx.Clear()
  EndIf
EndFunction

Function Fragment_Stage_0029_Item_00()
  Self.SetObjectiveCompleted(25, True)
  Alias_AudioLogKryx.Clear()
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveDisplayed(85, True, False)
  Self.SetStage(23)
EndFunction

Function Fragment_Stage_0095_Item_00()
  DialogueUCVigilance_BrigGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  DialogueUCVigilance_IntroBrigScene.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_BrigGuard.Clear()
EndFunction

Function Fragment_Stage_0115_Item_00()
  Alias_Jivanta.GetRef().Moveto(Alias_JivantaInspecting.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  DialogueUCVigilance_Jivanta_SceneTurret.Start()
EndFunction

Function Fragment_Stage_0125_Item_00()
  DialogueUCVigilance_Jivanta_SceneTurret.Stop()
EndFunction
