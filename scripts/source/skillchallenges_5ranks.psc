ScriptName SkillChallenges_5Ranks Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SkillActorValue Auto Const
ReferenceAlias Property PlayerRef Auto Const
Float Property Rank_1_Goal Auto Const
Float Property Rank_2_Goal Auto Const
Float Property Rank_3_Goal Auto Const
Float Property Rank_4_Goal Auto Const

;-- Functions ---------------------------------------

Event OnKill(ObjectReference akVictim)
  If Self.GetOwningQuest().GetStage() == 100
    
  ElseIf Self.GetOwningQuest().GetStage() == 200
    
  ElseIf Self.GetOwningQuest().GetStage() == 300
    
  ElseIf Self.GetOwningQuest().GetStage() == 400
    
  EndIf
EndEvent
