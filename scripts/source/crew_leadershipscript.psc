ScriptName Crew_LeadershipScript Extends Actor Const
{ Attach this script to any actor with the Cew_Leadership perk }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property CrewSlotCost Auto Const mandatory
{ will be set to CrewSlotCostValue on this actor OnInit }
Int Property CrewSlotCostValue = -1 Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  Self.ModValue(CrewSlotCost, CrewSlotCostValue as Float)
EndEvent
