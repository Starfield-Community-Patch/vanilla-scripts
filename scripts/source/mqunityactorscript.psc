ScriptName MQUnityActorScript Extends Actor

;-- Variables ---------------------------------------
Int BodyType_Feminine = 1 Const
Int BodyType_Masculine = 0 Const
Int Pronoun_HeHim = 1 Const
Int Pronoun_SheHer = 2 Const
Int Pronoun_TheyThem = 3 Const
Int Pronoun_Unselected = 0 Const

;-- Properties --------------------------------------
VoiceType Property UnityVoiceMale Auto Const mandatory
VoiceType Property UnityVoiceFemale Auto Const mandatory
VoiceType Property UnityVoiceNonBinary Auto Const mandatory
VoiceType Property UnityVoiceNonBinary_2 Auto Const mandatory
VisualEffect Property UnityActorEffect Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered")
    Actor PlayerREF = Game.GetPlayer()
    ActorBase PlayerBase = PlayerREF.GetBaseObject() as ActorBase
    Self.WaitFor3dLoad()
    Self.CopyAppearance(PlayerREF)
    If PlayerBase.GetPronoun() == Pronoun_TheyThem
      If PlayerBase.GetSex() == BodyType_Feminine
        Self.SetOverrideVoiceType(UnityVoiceNonBinary_2)
      Else
        Self.SetOverrideVoiceType(UnityVoiceNonBinary)
      EndIf
    ElseIf PlayerBase.GetSex() == BodyType_Feminine
      If PlayerBase.GetPronoun() == Pronoun_SheHer || PlayerBase.GetPronoun() == Pronoun_Unselected
        Self.SetOverrideVoiceType(UnityVoiceFemale)
      Else
        Self.SetOverrideVoiceType(UnityVoiceNonBinary_2)
      EndIf
    ElseIf PlayerBase.GetPronoun() == Pronoun_HeHim || PlayerBase.GetPronoun() == Pronoun_Unselected
      Self.SetOverrideVoiceType(UnityVoiceMale)
    Else
      Self.SetOverrideVoiceType(UnityVoiceNonBinary)
    EndIf
    UnityActorEffect.Play(Self as ObjectReference, -1.0, None)
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered

  Event OnLoad()
    ; Empty function
  EndEvent

  Event OnUnload()
    Self.gotostate("WaitingForPlayer")
  EndEvent
EndState
