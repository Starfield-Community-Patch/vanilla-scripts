ScriptName DefaultTutorialQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct TutorialMessageDatum
  String asEvent
  { Note: if you want multiple messages showing "together" you will need to make each have a different asEvent string. As per the ShowAsHelpMessage() param }
  String asUserEventToEnd = "None"
  { The User Event (button press) we are listening for in order to end the tutorial early. }
  Bool AlwaysShow = False
  { If True, then always show this Tutorial, even if the player has seen it before. }
  Float DelayTime = -1.0
  { If set, it will delay this amount of time before showing the message }
  Bool DelayFinished hidden
  { will be set when the timer has delayed this, and we are ready to show it }
  Bool TutorialSeen hidden
  { tracks if the player has seen this tutorial already }
  String asEventNext
  { This is the next event to send immediately after this one (for multiple part messages), make sure there is a struct defined for it in this array as well AND make sure there is a DelayTime set so they don't bash. }
  Message TutorialMessage
  { the message to display along with the objective which tells the player how to complete the objective }
  Message TutorialMessageMouseAndKeyboardSpecific
  { the message to display along with the objective which tells the player how to complete the objective... if NONE (default), show TutorialMessage for both, othewise show this if PC }
  Int AfDuration = 30
  { As per the ShowAsHelpMessage() param - how long to display }
  Int AfInterval = 30
  { As per the ShowAsHelpMessage() param - how much time between intervals }
  Int aiMaxTimes = 1
  { As per the ShowAsHelpMessage() param - how many times this message repeats. Defaults to only display once. }
  String asContext = ""
  { As per the ShowAsHelpMessage() param }
  Int aiPriority = 0
  { As per the ShowAsHelpMessage() param }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TutorialProperty
  defaulttutorialquestscript:tutorialmessagedatum[] Property TutorialMessageData Auto Const mandatory
  GlobalVariable Property TutorialAllowedGlobal Auto Const
  { if set, this global must be >= 1 to }
EndGroup


;-- Functions ---------------------------------------

Event OnTimer(Int aiTimerID)
  TutorialMessageData[aiTimerID].DelayFinished = True
  Self.ShowHelpMessage(TutorialMessageData[aiTimerID].asEvent)
EndEvent

Function ShowHelpMessage(String EventName)
  If TutorialAllowedGlobal as Bool && TutorialAllowedGlobal.GetValue() < 1.0
    Return 
  EndIf
  Int iFound = TutorialMessageData.findstruct("asEvent", EventName, 0)
  If iFound > -1
    If TutorialMessageData[iFound].AlwaysShow == True
      Self.ResetTutorial(EventName)
    EndIf
    If TutorialMessageData[iFound].TutorialSeen == True
      
    ElseIf TutorialMessageData[iFound].DelayTime > 0.0 && TutorialMessageData[iFound].DelayFinished == False
      Self.StartTimer(TutorialMessageData[iFound].DelayTime, iFound)
    Else
      Self.DoShowMessage(iFound)
      TutorialMessageData[iFound].TutorialSeen = True
      TutorialMessageData[iFound].DelayFinished = False
      If TutorialMessageData[iFound].asEventNext
        Self.ShowHelpMessage(TutorialMessageData[iFound].asEventNext)
      EndIf
    EndIf
  EndIf
EndFunction

Function UnshowHelpMessage(String EventName)
  Int iFound = TutorialMessageData.findstruct("asEvent", EventName, 0)
  If iFound > -1
    If TutorialMessageData[iFound].TutorialMessage
      TutorialMessageData[iFound].TutorialMessage.UnshowAsHelpMessage()
    EndIf
    If TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific
      TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific.UnshowAsHelpMessage()
    EndIf
  EndIf
EndFunction

Function DoShowMessage(Int iFound)
  String asUserEventToEnd = TutorialMessageData[iFound].asUserEventToEnd
  Message TutorialMessage = TutorialMessageData[iFound].TutorialMessage
  Message TutorialMessageMouseAndKeyboardSpecific = TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific
  Int AfDuration = TutorialMessageData[iFound].AfDuration
  Int AfInterval = TutorialMessageData[iFound].AfInterval
  Int aiMaxTimes = TutorialMessageData[iFound].aiMaxTimes
  String asContext = TutorialMessageData[iFound].asContext
  Int aiPriority = TutorialMessageData[iFound].aiPriority
  Message.ClearHelpMessages()
  If TutorialMessageMouseAndKeyboardSpecific == None
    TutorialMessage.ShowAsHelpMessage(asUserEventToEnd, AfDuration as Float, AfInterval as Float, aiMaxTimes, asContext, aiPriority, None)
  Else
    TutorialMessageMouseAndKeyboardSpecific.ShowAsHelpMessage(asUserEventToEnd, AfDuration as Float, AfInterval as Float, aiMaxTimes, asContext, aiPriority, TutorialMessage)
  EndIf
EndFunction

Function ResetTutorial(String EventName)
  Int iFound = TutorialMessageData.findstruct("asEvent", EventName, 0)
  TutorialMessageData[iFound].TutorialSeen = False
  Message.ResetHelpMessage(TutorialMessageData[iFound].asUserEventToEnd)
EndFunction

Function ResetAll()
  Int I = 0
  While I < TutorialMessageData.Length
    Self.ResetTutorial(TutorialMessageData[I].asEvent)
    I += 1
  EndWhile
EndFunction
