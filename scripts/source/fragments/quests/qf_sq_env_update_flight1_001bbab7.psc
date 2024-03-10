ScriptName Fragments:Quests:QF_SQ_ENV_Update_Flight1_001BBAB7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_envscript Property SQ_ENV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0999_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  While SQ_ENV.IsRunning() == False
    Utility.Wait(1.0)
  EndWhile
  SQ_ENV.Player.RefillAlias()
  Self.stop()
EndFunction
