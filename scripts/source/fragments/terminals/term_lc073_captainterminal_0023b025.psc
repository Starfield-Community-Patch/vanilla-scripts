;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_LC073_CaptainTerminal_0023B025 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] guardObjectReferences = akTerminalRef.GetRefsLinkedToMe(GuardKeyword)

int i = 0
while(i < guardObjectReferences.length)

Actor guardActor = guardObjectReferences[i] as Actor

guardActor.RemoveFromFaction(GuardFactionFriendly)
guardActor.AddToFaction(GuardFactionEnemy)

i = i + 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property GuardFactionFriendly Auto Const

Faction Property GuardFactionEnemy Auto Const

Keyword Property GuardKeyword Auto Const
