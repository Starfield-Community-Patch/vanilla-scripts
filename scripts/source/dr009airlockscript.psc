ScriptName DR009AirlockScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool initialized = False
Bool waitForPlayerArrival = False

;-- Properties --------------------------------------
Keyword Property CosmeticDoorKeyword Auto Const mandatory
Keyword Property InvisibleDoorKeyword Auto Const mandatory
Keyword Property ArrivalTriggerVolumeKeyword Auto Const mandatory
Keyword Property LinkedAirlockKeyword Auto Const mandatory
Float Property doorClosingSeconds Auto Const mandatory
Float Property WaitSeconds = 1.5 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If initialized == False
    Self.Init()
    DR009AirlockScript linkedAirlockScript = Self.GetLinkedRef(LinkedAirlockKeyword) as DR009AirlockScript
    If linkedAirlockScript != None
      linkedAirlockScript.Init()
    EndIf
  EndIf
EndEvent

Function Init()
  initialized == True
  ObjectReference arrivalTriggerVolume = Self.GetLinkedRef(ArrivalTriggerVolumeKeyword)
  If arrivalTriggerVolume != None
    Self.RegisterForRemoteEvent(arrivalTriggerVolume as ScriptObject, "OnTriggerEnter")
  EndIf
EndFunction

Event OnActivate(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer() as ObjectReference
  If akActionRef == player
    ObjectReference cosmeticDoor = Self.GetLinkedRef(CosmeticDoorKeyword)
    ObjectReference invisibleDoor = Self.GetLinkedRef(InvisibleDoorKeyword)
    DR009AirlockScript linkedAirlockScript = Self.GetLinkedRef(LinkedAirlockKeyword) as DR009AirlockScript
    If cosmeticDoor != None && invisibleDoor != None && linkedAirlockScript != None
      cosmeticDoor.SetOpen(False)
      Utility.Wait(doorClosingSeconds)
      linkedAirlockScript.waitForPlayerArrival()
      invisibleDoor.Activate(player, False)
    EndIf
  EndIf
EndEvent

Function waitForPlayerArrival()
  waitForPlayerArrival = True
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If waitForPlayerArrival
    waitForPlayerArrival = False
    ObjectReference cosmeticDoor = Self.GetLinkedRef(CosmeticDoorKeyword)
    If cosmeticDoor != None
      Utility.Wait(WaitSeconds)
      cosmeticDoor.SetOpen(True)
    EndIf
  EndIf
EndEvent
