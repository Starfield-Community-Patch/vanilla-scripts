ScriptName Fragments:Scenes:SF_Commitment_SamCoe_0800_Th_000DF488 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_13_End()
  com_commitmentquestscript kmyQuest = Self.GetOwningQuest() as com_commitmentquestscript
  kmyQuest.GiveCommitmentGift()
EndFunction
