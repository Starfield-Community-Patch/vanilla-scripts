ScriptName Fragments:Quests:QF_DialogueCFTheKey_RandomId_0000FBDC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueCFTheKey_RandomIdles_LastNova02 Auto Const mandatory
GlobalVariable Property CF_LastNovaPatronGlobal Auto Const mandatory
Quest Property DialogueCFTheKey_RandomIdles_LastNova01 Auto Const mandatory
Quest Property DialogueCFTheKey_RandomIdles_LastNova04 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture01 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture02 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture03 Auto Const mandatory
Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene03 Auto Const mandatory
Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene01 Auto Const mandatory
Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene02 Auto Const mandatory
ReferenceAlias Property Alias_Pirate03 Auto Const mandatory
ReferenceAlias Property Alias_Pirate04 Auto Const mandatory
ReferenceAlias Property Alias_Pirate05 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture04 Auto Const mandatory
Keyword Property AnimArchetypeConfident Auto Const mandatory
Keyword Property AnimArchetypePirate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  DialogueCFTheKey_RandomIdles_LastNovaScene03.Stop()
  Alias_PushUpFurniture01.GetRef().DisableNoWait(False)
  Alias_PushUpFurniture02.GetRef().DisableNoWait(False)
  Alias_PushUpFurniture03.GetRef().DisableNoWait(False)
  Alias_PushUpFurniture04.GetRef().DisableNoWait(False)
  Actor Pirate03 = Alias_Pirate03.GetActorRef()
  Actor Pirate04 = Alias_Pirate04.GetActorRef()
  Actor Pirate05 = Alias_Pirate05.GetActorRef()
  Pirate03.EvaluatePackage(False)
  Pirate04.EvaluatePackage(False)
  Pirate05.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueCFTheKey_RandomIdles_LastNova01.Start()
  DialogueCFTheKey_RandomIdles_LastNova02.Start()
  Int I = Utility.RandomInt(0, 4)
  CF_LastNovaPatronGlobal.SetValue(I as Float)
  DialogueCFTheKey_RandomIdles_LastNovaScene03.Start()
  Alias_PushUpFurniture01.GetRef().EnableNoWait(False)
  Alias_PushUpFurniture02.GetRef().EnableNoWait(False)
  Alias_PushUpFurniture03.GetRef().EnableNoWait(False)
  Alias_PushUpFurniture04.GetRef().EnableNoWait(False)
  Actor Pirate03 = Alias_Pirate03.GetActorRef()
  Actor Pirate04 = Alias_Pirate04.GetActorRef()
  ObjectReference Pirate05 = Alias_Pirate05.GetRef()
  Pirate03.RemoveKeyword(AnimArchetypePirate)
  Pirate03.AddKeyword(AnimArchetypeConfident)
  Pirate04.RemoveKeyword(AnimArchetypePirate)
  Pirate04.AddKeyword(AnimArchetypeConfident)
  Pirate03.SnapIntoInteraction(Pirate03.GetLinkedRef(None))
  Pirate04.SnapIntoInteraction(Pirate04.GetLinkedRef(None))
  Pirate05.MoveTo(Pirate05.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  DialogueCFTheKey_RandomIdles_LastNovaScene01.Stop()
  DialogueCFTheKey_RandomIdles_LastNovaScene02.Stop()
  DialogueCFTheKey_RandomIdles_LastNovaScene03.Stop()
  DialogueCFTheKey_RandomIdles_LastNova01.Stop()
  DialogueCFTheKey_RandomIdles_LastNova02.Stop()
  DialogueCFTheKey_RandomIdles_LastNova04.Stop()
  Self.Stop()
EndFunction
