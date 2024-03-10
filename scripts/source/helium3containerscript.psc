ScriptName Helium3ContainerScript Extends ObjectReference
{ script for helium 3 container }

;-- Variables ---------------------------------------
Bool isOpen
ObjectReference playerRef

;-- Properties --------------------------------------
String Property myOpenAnimation = "play01" Auto Const
String Property myCloseAnimation = "play02" Auto Const
MiscObject Property myMiscItem Auto Const
Bool Property startOpen = False Auto
Message Property myMessage Auto

;-- Functions ---------------------------------------

Event OnLoad()
  playerRef = Game.GetPlayer() as ObjectReference
  If startOpen == True
    isOpen = True
    Utility.wait(5.0)
    Self.PlayAnimationAndWait(myOpenAnimation, "done")
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == playerRef
    If isOpen == True
      If playerRef.GetItemCount(myMiscItem as Form) > 0
        isOpen = False
        playerRef.RemoveItem(myMiscItem as Form, 1, False, None)
        Self.PlayAnimationAndWait(myCloseAnimation, "done")
      Else
        myMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    Else
      isOpen = True
      Self.PlayAnimationAndWait(myOpenAnimation, "done")
      playerRef.AddItem(myMiscItem as Form, 1, False)
    EndIf
  EndIf
EndEvent
