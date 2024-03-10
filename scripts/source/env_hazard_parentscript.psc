ScriptName ENV_Hazard_ParentScript Extends ObjectReference Const
{ Attach this script to the Packin's PrefabPackinPivotDummy reference.
And make sure all the refs in the packin are LinkedRef'd with keyword ENV_Link_PackinMember to the PrefabPackinPivotDummy (that this script is on) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill_Properties
  Form Property PrefabPackinPivotDummy Auto Const mandatory
  { a default object that is in every instanced packin. 
	It inherits the scripts and linked refs and linked children from the packin ref placed in the render window, or otherwise spawned. }
  Keyword Property ENV_Link_PackinMember Auto Const mandatory
  { Things inside ENV Hazard packins link to the PrefabPackinPivotDummy using this keyword.
	It's how we identify refs that came from the same packin. }
  Keyword Property ENV_FXType_Ambient Auto Const mandatory
  { Things with this keyword are "ambient" fx that are okay to clip through lanscape and other objects.
	We may want to turn these on/off depending on circumstances. }
EndGroup


;-- Functions ---------------------------------------

ObjectReference[] Function GetPackinChildren()
  Return Self.GetRefsLinkedToMe(ENV_Link_PackinMember, None)
EndFunction

ObjectReference[] Function GetExternalLinkedChildren()
  Return Self.GetRefsLinkedToMe(None, ENV_Link_PackinMember)
EndFunction

Function DisableChildren()
  ObjectReference[] packinChildren = Self.GetPackinChildren()
  Int I = 0
  While I < packinChildren.Length
    packinChildren[I].DisableNoWait(False)
    I += 1
  EndWhile
EndFunction

Function EnableChildren()
  ObjectReference[] packinChildren = Self.GetPackinChildren()
  Int I = 0
  While I < packinChildren.Length
    packinChildren[I].EnableNoWait(False)
    I += 1
  EndWhile
EndFunction

ENV_Hazard_ParentScript Function GetPackinParent(ObjectReference RefToCheck, Keyword ENV_Link_PackinMember) Global
  ENV_Hazard_ParentScript parentRef = RefToCheck as ENV_Hazard_ParentScript
  If parentRef
    Return parentRef
  Else
    parentRef = RefToCheck.GetLinkedRef(ENV_Link_PackinMember) as ENV_Hazard_ParentScript
    If parentRef
      Return parentRef
    Else
      Return None
    EndIf
  EndIf
EndFunction

Keyword Function BetaOnly_Get_ENV_Link_PackinMember() Global
  Return Game.GetFormFromFile(1444913, "Starfield.esm") as Keyword
EndFunction

Function LogPackinMembers(ObjectReference PackinMember) Global
  ENV_Hazard_ParentScript parentRef = ENV_Hazard_ParentScript.GetPackinParent(PackinMember, ENV_Hazard_ParentScript.BetaOnly_Get_ENV_Link_PackinMember())
  If parentRef == None
    parentRef.warning(None, "LogPackinMembers() could not find a parent for PackinMember: " + PackinMember as String, 2, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, True, True)
    Return 
  EndIf
  ObjectReference[] packinChildren = parentRef.GetPackinChildren()
  Int I = 0
  While I < packinChildren.Length
    I += 1
  EndWhile
EndFunction

Function LogExternalObjects(ObjectReference PackinMember) Global
  ENV_Hazard_ParentScript parentRef = ENV_Hazard_ParentScript.GetPackinParent(PackinMember, ENV_Hazard_ParentScript.BetaOnly_Get_ENV_Link_PackinMember())
  If parentRef == None
    parentRef.warning(parentRef as ScriptObject, "LogExternalObjects() could not find a parent for PackinMember: " + PackinMember as String, 2, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, True, True)
    Return 
  EndIf
  ObjectReference[] externalChildren = parentRef.GetExternalLinkedChildren()
  Int I = 0
  While I < externalChildren.Length
    I += 1
  EndWhile
EndFunction

Function LogAllObjects(ObjectReference PackinMember) Global
  ENV_Hazard_ParentScript.LogPackinMembers(PackinMember)
  ENV_Hazard_ParentScript.LogExternalObjects(PackinMember)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction

; Fixup hacks for debug-only function: GlobalWarning
Bool Function GlobalWarning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames) Global
  Return false
EndFunction
