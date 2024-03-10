ScriptName OtherPlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int BodyType_Feminine = 1 Const
Int BodyType_Masculine = 0 Const
Int Pronoun_HeHim = 1 Const
Int Pronoun_SheHer = 2 Const
Int Pronoun_TheyThem = 3 Const
Int Pronoun_Unselected = 0 Const

;-- Properties --------------------------------------
VoiceType Property NPCFOtherPlayer Auto Const mandatory
VoiceType Property NPCMOtherPlayer Auto Const mandatory
VoiceType Property NPCXOtherPlayer Auto Const mandatory
VoiceType Property NPCXOtherPlayer_2 Auto Const mandatory
Idle Property Stage2 Auto Const mandatory
Idle Property Stage3 Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered")
    Actor PlayerREF = Game.GetPlayer()
    ActorBase PlayerBase = PlayerREF.GetBaseObject() as ActorBase
    Actor SelfREF = Self.GetActorRef()
    SelfREF.WaitFor3dLoad()
    SelfREF.CopyAppearance(PlayerREF)
    If PlayerBase.GetPronoun() == Pronoun_TheyThem
      If PlayerBase.GetSex() == BodyType_Feminine
        SelfREF.SetOverrideVoiceType(NPCXOtherPlayer_2)
      Else
        SelfREF.SetOverrideVoiceType(NPCXOtherPlayer)
      EndIf
    ElseIf PlayerBase.GetSex() == BodyType_Feminine
      If PlayerBase.GetPronoun() == Pronoun_SheHer || PlayerBase.GetPronoun() == Pronoun_Unselected
        SelfREF.SetOverrideVoiceType(NPCFOtherPlayer)
      Else
        SelfREF.SetOverrideVoiceType(NPCXOtherPlayer_2)
      EndIf
    ElseIf PlayerBase.GetPronoun() == Pronoun_HeHim || PlayerBase.GetPronoun() == Pronoun_Unselected
      SelfREF.SetOverrideVoiceType(NPCMOtherPlayer)
    Else
      SelfREF.SetOverrideVoiceType(NPCXOtherPlayer)
    EndIf
    Self.GetActorRef().PlayIdle(Stage2)
    Utility.Wait(2.0)
    Self.GetActorRef().PlayIdle(Stage3)
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered

  Event OnUnload()
    Self.gotostate("WaitingForPlayer")
  EndEvent

  Event OnLoad()
    Self.GetActorRef().PlayIdle(Stage2)
    Utility.Wait(2.0)
    Self.GetActorRef().PlayIdle(Stage3)
  EndEvent
EndState
