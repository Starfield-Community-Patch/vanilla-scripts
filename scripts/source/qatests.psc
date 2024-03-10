ScriptName QATests Extends Quest

;-- Variables ---------------------------------------
String sDisableVanity = "setIni \"bDisableAutoVanityMode:camera\" 1" Const
String sScreenshot = "Screenshot" Const

;-- Functions ---------------------------------------

Function TestEquip(Actor ActorToEquip, FormList FormlistToTest, Float PauseDuration, Bool RemoveAllFirst, Bool TakeScreenshot)
  If RemoveAllFirst
    ActorToEquip.RemoveAllItems(None, False, False)
  EndIf
  If TakeScreenshot
    
  EndIf
  Int I = 0
  Int iMax = FormlistToTest.GetSize()
  While I < iMax
    Form currentForm = FormlistToTest.GetAt(I)
    ActorToEquip.EquipItem(currentForm, False, True)
    If TakeScreenshot
      
    EndIf
    Utility.Wait(PauseDuration)
    I += 1
  EndWhile
EndFunction
