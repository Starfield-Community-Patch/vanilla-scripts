ScriptName Fragments:Quests:QF_Patch_BEShips_002292EB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
belandingquestscript[] Property BELandings Auto Const mandatory
bescript[] Property BEGenerics Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Int I = 0
  While I < BELandings.Length
    BELandings[I].PATCH_RecheckLanding()
    I += 1
  EndWhile
  I = 0
  While I < BEGenerics.Length
    BEGenerics[I].PATCH_RetryTakeoff()
    I += 1
  EndWhile
  Self.Stop()
EndFunction
