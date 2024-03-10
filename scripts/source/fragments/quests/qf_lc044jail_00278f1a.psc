ScriptName Fragments:Quests:QF_LC044Jail_00278F1A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property LC044RyujinGuardEnemeyFaction Auto Const
ReferenceAlias Property Alias_NPCJailGuard Auto Const mandatory
Scene Property LC044GuardJailScene Auto Const
Faction Property LC044RyujinGuardCrimeFaction Auto Const
ReferenceAlias Property Alias_EavesdropTriggerEscape01 Auto Const mandatory
ReferenceAlias Property Alias_EavesdropTriggerEscape02 Auto Const mandatory
Cell Property LC044RyujinIndustriesHQ Auto Const
Scene Property LC044_EscapeCell_EavesdroppingScene Auto Const
Scene Property LC044_EscapeCell02_EavesdroppingScene Auto Const
Quest Property RI04 Auto Const
Quest Property LC044 Auto Const
ReferenceAlias Property Alias_LC044JailPlayerMarker Auto Const mandatory
ReferenceAlias Property Alias_JailDoor Auto Const mandatory
ReferenceAlias Property Alias_JailTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_JailTrigger.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0027_Item_00()
  Quest __temp = Self as Quest
  lc044jail_questscript kmyQuest = __temp as lc044jail_questscript
  Alias_JailDoor.GetRef().SetOpen(False)
  Alias_JailDoor.GetRef().SetLockLevel(25)
  Alias_NPCJailGuard.GetActorRef().Enable(False)
  Alias_EavesdropTriggerEscape01.GetRef().Enable(False)
  Alias_EavesdropTriggerEscape02.GetRef().Enable(False)
  RI04.setstage(410)
  Game.GetPlayer().MoveTo(Alias_LC044JailPlayerMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  kmyQuest.StartJailTimer()
EndFunction

Function Fragment_Stage_0028_Item_00()
  LC044GuardJailScene.Start()
EndFunction

Function Fragment_Stage_0030_Item_00()
  LC044RyujinIndustriesHQ.SetFactionOwner(LC044RyujinGuardCrimeFaction)
  Game.GetPlayer().RemoveFromFaction(LC044RyujinGuardCrimeFaction)
  Game.GetPlayer().AddToFaction(LC044RyujinGuardEnemeyFaction)
  LC044_EscapeCell_EavesdroppingScene.Start()
EndFunction
