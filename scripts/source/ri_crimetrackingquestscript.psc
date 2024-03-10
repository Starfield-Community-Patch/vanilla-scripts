ScriptName RI_CrimeTrackingQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_TotalArrestCount Auto Const mandatory
GlobalVariable Property RI_TotalBodyCount Auto Const mandatory
GlobalVariable Property RI_TotalBountiesCount Auto Const mandatory
GlobalVariable Property RI_CreditsRewardDeductionSmall Auto Const mandatory
GlobalVariable Property RI_CreditsRewardDeductionMedium Auto Const mandatory
GlobalVariable Property RI_CreditsRewardDeductionLarge Auto Const mandatory
GlobalVariable Property RI_CrimeCountSmall Auto Const mandatory
GlobalVariable Property RI_CrimeCountMedium Auto Const mandatory
GlobalVariable Property RI_CrimeCountLarge Auto Const mandatory
GlobalVariable Property RewardGlobal Auto Const mandatory
GlobalVariable Property RI_CreditsReward Auto mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
Int Property iCompletionStage Auto Const mandatory
Int Property iTimesArrested Auto conditional
Int Property iBodyCount Auto conditional
Int Property iBountiesGained Auto conditional
Int Property iTheftArrest Auto conditional
Int Property iAttemptedMurderArrest Auto conditional
Int Property iMurderArrest Auto conditional

;-- Functions ---------------------------------------

Function SetRewardValues()
  RI_CreditsReward.SetValue(RewardGlobal.GetValue())
EndFunction

Function AddFinalValues()
  Float fCurrentArrestTotal = RI_TotalArrestCount.GetValue()
  Float fCurrentBodyTotal = RI_TotalBodyCount.GetValue()
  Float fCurrentBountyTotal = RI_TotalBountiesCount.GetValue()
  RI_TotalArrestCount.SetValue(fCurrentArrestTotal + iTimesArrested as Float)
  RI_TotalBodyCount.SetValue(fCurrentBodyTotal + iBodyCount as Float)
  RI_TotalBountiesCount.SetValue(fCurrentBountyTotal + iBountiesGained as Float)
  Self.CalculateRewards()
EndFunction

Function CalculateRewards()
  If RI08_MasakoRemainedCEO.GetValue() != 0.0
    Float fTotalOffenses = (iTimesArrested + iBodyCount + iBountiesGained) as Float
    Float fCurrentReward = RewardGlobal.GetValue()
    Float fCrimeCountSmall = RI_CrimeCountSmall.GetValue()
    Float fCrimeCountMedium = RI_CrimeCountMedium.GetValue()
    Float fCrimeCountLarge = RI_CrimeCountLarge.GetValue()
    If fTotalOffenses == 0.0
      RI_CreditsReward.SetValue(fCurrentReward)
    ElseIf fTotalOffenses >= fCrimeCountSmall && fTotalOffenses < fCrimeCountMedium
      RI_CreditsReward.SetValue(fCurrentReward - fCurrentReward * RI_CreditsRewardDeductionSmall.GetValue())
    ElseIf fTotalOffenses >= fCrimeCountMedium && fTotalOffenses < fCrimeCountLarge
      RI_CreditsReward.SetValue(fCurrentReward - fCurrentReward * RI_CreditsRewardDeductionMedium.GetValue())
    ElseIf fTotalOffenses >= fCrimeCountLarge
      RI_CreditsReward.SetValue(fCurrentReward - fCurrentReward * RI_CreditsRewardDeductionLarge.GetValue())
    EndIf
  EndIf
  If RI08_MasakoRemainedCEO.GetValue() == 0.0
    RI_CreditsReward.SetValue(RewardGlobal.GetValue())
  EndIf
  Self.SetStage(iCompletionStage)
EndFunction
