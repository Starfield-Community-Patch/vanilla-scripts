ScriptName Fragments:Packages:PF_City_CY_RedTape01_HRToBar_0010FB23 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene[] Property sceneToPlay Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(Actor akActor)
  If Game.GetPlayer().GetDistance(akActor as ObjectReference) <= 100.0
    Int iRandom = Utility.RandomInt(0, sceneToPlay.Length)
    sceneToPlay[iRandom].Start()
  EndIf
EndFunction
