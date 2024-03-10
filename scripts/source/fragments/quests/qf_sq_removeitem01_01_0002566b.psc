ScriptName Fragments:Quests:QF_SQ_RemoveItem01_01_0002566B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property BotPickUpSound Auto Const mandatory
ReferenceAlias Property Bot Auto Const
ReferenceAlias Property theItem Auto Const
wwiseevent Property BotSuccessSound Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference theBot = Bot.GetRef()
  theBot.AddItem(theItem.GetRef() as Form, 1, False)
  Int s1 = BotPickUpSound.Play(theBot, None, None)
  Utility.Wait(2.0)
  Int s2 = BotSuccessSound.Play(theBot, None, None)
  Self.Stop()
EndFunction
