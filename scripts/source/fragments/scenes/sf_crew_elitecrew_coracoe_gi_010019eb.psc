ScriptName Fragments:Scenes:SF_CREW_EliteCrew_CoraCoe_Gi_010019EB Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Cora Auto Const mandatory
FormList Property BookFormList Auto Const mandatory
Keyword Property BookKeyword Auto Const mandatory
GlobalVariable Property CoraBookGlobal Auto Const mandatory
Scene Property CREW_EliteCrew_CoraCoe_GiveBooks Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  ObjectReference CoraRef = Cora.GetRef()
  Int BookCount = CoraRef.GetItemCount(BookKeyword as Form)
  CoraBookGlobal.SetValue(BookCount as Float)
  Cora.GetRef().OpenOneWayTransferMenu(True, BookFormList)
EndFunction

Function Fragment_Phase_03_End()
  ObjectReference CoraRef = Cora.GetRef()
  Int BookCount = CoraRef.GetItemCount(BookKeyword as Form)
  If BookCount <= CoraBookGlobal.GetValueInt()
    CREW_EliteCrew_CoraCoe_GiveBooks.Stop()
  EndIf
EndFunction
