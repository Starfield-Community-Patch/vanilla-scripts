ScriptName SQ_DoctorsScript Extends Quest

;-- Variables ---------------------------------------
MiscObject Credits
Actor PlayerRef
Int iHealMax = 999999999

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property PrimaryAliasDoctor Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Wounds Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Afflictions Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Addictions Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Everything Auto Const mandatory
  Spell Property SQ_Doctors_CureAll Auto Const mandatory
  Spell Property CureAddictions Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function CannotPay()
  ; Empty function
EndFunction

Event OnQuestInit()
  PlayerRef = Game.GetPlayer()
  Credits = Game.GetCredits()
EndEvent

Function BuySupplies()
  PrimaryAliasDoctor.GetActorReference().ShowBarterMenu()
EndFunction

Function HealWounds()
  Self.PayForService(SQ_Doctors_Price_Wounds)
  PlayerRef.RestoreValue(Game.GetHealthAV(), iHealMax as Float)
EndFunction

Function HealAfflictions()
  Self.PayForService(SQ_Doctors_Price_Afflictions)
  SQ_Doctors_CureAll.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
EndFunction

Function HealAddictions()
  Self.PayForService(SQ_Doctors_Price_Addictions)
  CureAddictions.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
EndFunction

Function HealEverything()
  Self.PayForService(SQ_Doctors_Price_Everything)
  PlayerRef.RestoreValue(Game.GetHealthAV(), iHealMax as Float)
  CureAddictions.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
  SQ_Doctors_CureAll.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
EndFunction

Function PayForService(GlobalVariable CostGlobal)
  PlayerRef.RemoveItem(Credits as Form, CostGlobal.GetValueInt(), False, None)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
