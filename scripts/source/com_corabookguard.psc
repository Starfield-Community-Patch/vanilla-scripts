ScriptName COM_CoraBookGuard Extends Quest

;-- Variables ---------------------------------------
Int CoraEndingBookCount
Int CoraStartingBookCount

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CoraGuardCount
Guard CoraGuardReward

;-- Properties --------------------------------------
Group QuestProperties
  ReferenceAlias Property Cora Auto Const mandatory
  Keyword Property BookKeyword Auto Const mandatory
  FormList Property BookFormList Auto Const mandatory
  GlobalVariable Property CoraBookGlobal Auto Const mandatory
  Int Property XPperbook = 2 Auto Const mandatory
  Scene Property CREW_EliteCrew_CoraCoe_GiveBooks Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function CheckCountAndOpenMenu()
  ObjectReference CoraRef = Cora.GetRef()
  Guard CoraGuardCount ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    CoraStartingBookCount = CoraRef.GetItemCount(BookKeyword as Form)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  CoraRef.OpenOneWayTransferMenu(True, BookFormList)
EndFunction

Function CalculateReward()
  Guard CoraGuardReward, CoraGuardCount ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference CoraRef = Cora.GetRef()
    CoraEndingBookCount = CoraRef.GetItemCount(BookKeyword as Form)
    Int BooksAdded = CoraEndingBookCount - CoraStartingBookCount
    If BooksAdded > 0
      Int XPAdded = BooksAdded * XPperbook
      Game.RewardPlayerXP(XPAdded, True)
    Else
      CREW_EliteCrew_CoraCoe_GiveBooks.Stop()
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
