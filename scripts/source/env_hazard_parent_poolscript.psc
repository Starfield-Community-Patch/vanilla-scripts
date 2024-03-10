ScriptName ENV_Hazard_Parent_PoolScript Extends ENV_Hazard_ParentScript Const
{ see also: ENV_Hazard_ParentScript
Attach this script to the Packin's PrefabPackinPivotDummy reference.
And make sure all the refs in the packin are LinkedRef'd with keyword ENV_Link_PackinMember to the PrefabPackinPivotDummy (that this script is on) }

;-- Variables ---------------------------------------
Int ChanceAmbientFX = 50 Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RollAndSetAmbientEnableState(ChanceAmbientFX)
EndEvent

Function RollAndSetAmbientEnableState(Int Chance)
  ObjectReference[] ambientFXRefs = Self.GetPackinChildren()
  ambientFXRefs = commonarrayfunctions.GetReferencesWithMatchingKeyword(ambientFXRefs, ENV_FXType_Ambient)
  Int I = 0
  While I < ambientFXRefs.Length
    If Game.GetDieRollSuccess(Chance, 1, 100, -1, -1)
      ambientFXRefs[I].EnableNoWait(False)
    Else
      ambientFXRefs[I].DisableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function DebugEnableAllAmbientFX()
  Self.Trace(Self as ScriptObject, "DebugEnableAllAmbientFX()", 0, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, False, True)
  Self.RollAndSetAmbientEnableState(100)
EndFunction

Function DebugDisableAllAmbientFX()
  Self.Trace(Self as ScriptObject, "DebugDisableAllAmbientFX()", 0, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, False, True)
  Self.RollAndSetAmbientEnableState(0)
EndFunction
