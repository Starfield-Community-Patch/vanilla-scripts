ScriptName DialogueCydoniaQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property DialogueCydonia_HorusAid_CooldownTime Auto Const mandatory
LeveledItem Property LL_CY_HorusGift Auto Const mandatory
Float Property CooldownTimerDays = 7.0 Auto Const
RefCollectionAlias Property AllMiners Auto Const mandatory
Weapon Property Cutter Auto Const mandatory

;-- Functions ---------------------------------------

Function HorusAid()
  Game.GetPlayer().AddItem(LL_CY_HorusGift as Form, 1, False)
  Self.SetCooldown()
EndFunction

Function SetCooldown()
  Float fDayLength = Game.GetPlayer().GetCurrentPlanet().GetDayLength()
  DialogueCydonia_HorusAid_CooldownTime.SetValue(Utility.GetCurrentGameTime() + fDayLength * CooldownTimerDays)
EndFunction

Function SwapCutters()
  Bool bCutterEquipped = False
  Int I = 0
  Int iCount = AllMiners.GetCount()
  While I < iCount
    Actor myMiner = AllMiners.GetAt(I) as Actor
    If myMiner.GetItemCount(Cutter as Form) > 0 && myMiner.IsDead() == False
      If myMiner.IsEquipped(Cutter as Form)
        bCutterEquipped = True
      Else
        bCutterEquipped = False
      EndIf
      myMiner.RemoveItem(Cutter as Form, 1, False, None)
      myMiner.AddItem(Cutter as Form, 1, False)
      If bCutterEquipped == True
        myMiner.EquipItem(Cutter as Form, False, False)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction
