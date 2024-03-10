ScriptName Fragments:Packages:PF_TestJeffBPackageMourn_000015FF Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
idlemarker Property myIdleMarker Auto Const
Furniture Property myfurniture1 Auto Const
Furniture Property myFurniture2 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Bool doOnce = False
  Int rand = Utility.RandomInt(0, 2)
  If doOnce == False
    doOnce = True
    If rand == 0
      akActor.placeAtMe(myIdleMarker as Form, 1, False, False, True, None, None, True)
    ElseIf rand == 1
      akActor.placeAtMe(myfurniture1 as Form, 1, False, False, True, None, None, True)
    Else
      akActor.placeAtMe(myFurniture2 as Form, 1, False, False, True, None, None, True)
    EndIf
  EndIf
EndFunction
