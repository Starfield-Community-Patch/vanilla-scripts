ScriptName LandmarkScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property LandmarkCompleteMessage Auto Const mandatory
GlobalVariable Property LandmarkTotal Auto Const mandatory
GlobalVariable Property LandmarkTracker Auto Const mandatory
LeveledItem Property Landmark_SpacesuitRewardArmor Auto Const mandatory

;-- Functions ---------------------------------------

Function LandmarkFound()
  Float fLandmarksFound = LandmarkTracker.Mod(1.0)
  If fLandmarksFound == LandmarkTotal.GetValue()
    Game.GetPlayer().AddItem(Landmark_SpacesuitRewardArmor as Form, 1, False)
    LandmarkCompleteMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction
