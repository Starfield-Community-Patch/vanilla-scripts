ScriptName MQStarbornEmissaryActorScript Extends Actor

;-- Variables ---------------------------------------
Int iRandomCompanion = -1

;-- Properties --------------------------------------
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
GlobalVariable Property MQ_EmissaryRandom Auto Const mandatory
Idle Property Stage2NoTransition Auto Const mandatory
Actor[] Property CompanionArray Auto Const
Outfit Property Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter Auto Const mandatory
Armor Property SpaceSuit_Starborn_Companion_PlayerOrFollower Auto Const mandatory
Armor Property SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered")
    Self.WaitFor3dLoad()
    If iRandomCompanion != -1
      Actor SetCompanionPicked = CompanionArray[iRandomCompanion]
      Self.CopyAppearance(SetCompanionPicked)
      Self.SetOverrideVoiceType(SetCompanionPicked.GetVoiceType())
    ElseIf MQ_EmissaryRandom.GetValueInt() == 1
      iRandomCompanion = Utility.RandomInt(0, 3)
      Actor CompanionPicked = CompanionArray[iRandomCompanion]
      Self.CopyAppearance(CompanionPicked)
      Self.SetOverrideVoiceType(CompanionPicked.GetVoiceType())
    ElseIf MQ00_CompanionWhoDies != None
      Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
      Self.CopyAppearance(DeadCompanionREF)
    EndIf
    If MQ_EmissaryRevealed.GetValueInt() >= 1
      Self.RemoveItem(SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE as Form, 1, False, None)
      Self.EquipItem(SpaceSuit_Starborn_Companion_PlayerOrFollower as Form, False, False)
      Self.SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, True)
    EndIf
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
