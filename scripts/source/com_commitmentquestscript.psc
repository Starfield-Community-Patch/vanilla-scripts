ScriptName COM_CommitmentQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CompanionAlias Auto Const mandatory
ReferenceAlias Property CommitmentGiftAlias Auto Const mandatory
MiscObject Property CommitmentGift Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory

;-- Functions ---------------------------------------

Function GiveCommitmentGift()
  Game.GetPlayer().AddAliasedItem(CommitmentGift as Form, CommitmentGiftAlias as Alias, 1, False)
  (SQ_Companions as sq_companionsscript).CommitmentGifts.AddRef(CommitmentGiftAlias.GetRef())
EndFunction

Function MakeCommitted()
  (CompanionAlias.GetActorReference() as companionactorscript).COM_CompanionQuest.MakeCommitted()
EndFunction
