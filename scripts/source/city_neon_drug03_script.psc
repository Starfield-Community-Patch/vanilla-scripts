ScriptName City_Neon_Drug03_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Neon_Drug_Game Auto Const mandatory
Int Property maxRefills = 1 Auto Const
{ how many "refills" will player get on retries, per round }

;-- Functions ---------------------------------------

Function ReplayGame()
  City_Neon_Drug_Game.Stop()
  City_Neon_Drug_Game.Reset()
  City_Neon_Drug_Game.Start()
EndFunction
