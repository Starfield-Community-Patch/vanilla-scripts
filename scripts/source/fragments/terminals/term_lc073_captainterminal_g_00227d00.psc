ScriptName Fragments:Terminals:TERM_LC073_CaptainTerminal_G_00227D00 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property GuardFactionFriendly Auto Const
Faction Property GuardFactionEnemy Auto Const
Keyword Property GuardKeyword Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  ObjectReference[] guardObjectReferences = akTerminalRef.GetRefsLinkedToMe(GuardKeyword, None)
  Int I = 0
  While I < guardObjectReferences.Length
    Actor guardActor = guardObjectReferences[I] as Actor
    guardActor.RemoveFromFaction(GuardFactionFriendly)
    guardActor.AddToFaction(GuardFactionEnemy)
    I += 1
  EndWhile
EndFunction
